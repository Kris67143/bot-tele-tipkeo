
# Sử dụng image Python cơ sở
FROM python:3.11-slim

# Cài đặt các dependencies cần thiết cho Playwright/Chromium
# Các gói cơ bản cho headless Chrome
RUN apt-get update && apt-get install -y \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libgbm1 \
    libexpat1 \
    libdbus-1-3 \
    libdrm2 \
    libgconf-2-4 \
    libfontconfig1 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgnutls30 \
    libjpeg-turbo8 \
    liblcms2-2 \
    libsecret-1-0 \
    libvulkan1 \
    libwebp6 \
    libx11-6 \
    libxcomposite1 \
    libxdmcp6 \
    libxext6 \
    libxkbcommon0 \
    libxrandr2 \
    libxrender1 \
    wget \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file requirements và cài đặt Python packages
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Cài đặt các trình duyệt Playwright (chỉ cần chromium)
RUN playwright install chromium

# Sao chép code
COPY . .

# Lệnh chạy chính (Giả sử file code là bot_scraper.py)
CMD ["python", "bot_scraper.py"]
