Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEF7FF293
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Nov 2023 15:40:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CACA8C6B479;
	Thu, 30 Nov 2023 14:40:40 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7719C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 14:40:39 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-50abbb23122so1466574e87.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 06:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701355239; x=1701960039;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nl7qKs0xMYqVNDHH9WM4FezV7LHdF3ESnzYoyQ/wiNc=;
 b=KQzLkhUAcwNJILpsJSfhB+oVsFBCRfRhNWgisSsjiwRE5jfYsKy0q0svdAPW0oYnba
 KxlYM5yGNzMv+ON49o5IJilrGgDrwnHjYc+XqXgxYi7EizsVdtt70mWIXeh5KFEz5qG/
 DUQqD/EN2n4POFVZUnScZRtrEFOlQ4CCHJYAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701355239; x=1701960039;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nl7qKs0xMYqVNDHH9WM4FezV7LHdF3ESnzYoyQ/wiNc=;
 b=lhk349YOrjA9NOl+Wg8f49KRKBzBxV99adukfq7zxuApKv/1qbuvOa8XFm2LGtdWaP
 LWSscs7zqFeaUABxe08AAhuXyLeSzTv1//raV4wV8fzDSNfcObRXu+rk/VWkfSL3n/hM
 ylvbxnTvvCr734KtjSXdI/Xy9t0WvG22nz0rrLvgpdoMv9RRhhLgbLpVlFsRXeUWHVyW
 lxD2CMlUqSnmD7s4yME44hHU3IZQbNJBd+B98tCJd6YF3eLJRKD7hvakQer6hek8iPK/
 myhzwl++EDBzHlhTt5mcdU4vG3gAMtkg8McjI1UfTtFvUVtkr6wi6AXJCtjSV2XgSKyW
 kfcg==
X-Gm-Message-State: AOJu0YxeWVA+kek2dWqcFhgSQ3Z0XyK0C5gATosouwkRhYIuoHy61A5o
 dQnaHjWTChQKR2TR9Do90DOnVg==
X-Google-Smtp-Source: AGHT+IFPLJIZ00kzHbdg1p5ZlWgoE+kuhys/QRV3xPtAJLJdTEjAvMQjDoGy8cth2tfgswu4IlzDJQ==
X-Received: by 2002:ac2:510a:0:b0:50b:d177:d9d9 with SMTP id
 q10-20020ac2510a000000b0050bd177d9d9mr1035944lfb.46.1701355238985; 
 Thu, 30 Nov 2023 06:40:38 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:d1eb:b106:516d:db0a])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a1709064a9500b00a18399ff790sm733470eju.215.2023.11.30.06.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 06:40:38 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 30 Nov 2023 15:40:01 +0100
Message-ID: <20231130144033.1850298-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Anatolij Gustschin <agust@denx.de>,
 Simon Glass <sjg@chromium.org>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RESEND RFC PATCH v2 0/5] Support display on
	stm32f469-disco board
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

The series adds support for the Orise Tech OTM8009A display on the
stm32f469-disco board. Substantial differences in the drivers for clock
management, LTDC and DSI compared to Linux, made it necessary to modify
the device tree. These changes were made in stm32f469-disco-uboot.dtsi to
avoid altering the Linux device tree. It is therefore desirable, as soon
as possible, to add these drivers the functionalities so that they do not
require device tree properties that deviate from those present in the Linux
version.

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag to patches 1, 2 and 3 of the series.
- Fix frame buffer allocation for stm32f469 discovery board.

Dario Binacchi (5):
  ARM: dts: stm32f469-disco: sync with Linux 6.5
  ARM: dts: stm32: make the LTDC clock usable by the clock driver
  ARM: dts: stm32: make the DSI clock usable by the clock driver
  ARM: dts: stm32: support display on stm32f469-disco board
  board: stm32f469-disco: add splash screen with stmicroelectronics logo

 arch/arm/dts/stm32f469-disco-u-boot.dtsi |  13 ++++++++++
 arch/arm/dts/stm32f469-disco.dts         |   4 +--
 configs/stm32f469-discovery_defconfig    |  16 ++++++++++++
 drivers/video/stm32/stm32_ltdc.c         |  31 +++++++++++++++++++++++
 include/configs/stm32f469-discovery.h    |   2 ++
 tools/logos/stm32f469-discovery.bmp      | Bin 0 -> 18532 bytes
 6 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 tools/logos/stm32f469-discovery.bmp

-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
