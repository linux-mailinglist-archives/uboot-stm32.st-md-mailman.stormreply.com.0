Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4A14711C
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 19:48:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 73010C36B0B
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Jan 2020 18:48:33 +0000 (UTC)
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E434DC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 18:48:31 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id c4so2875055ilo.7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 10:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfacSKx5YvhMZbQUK3CWKg7i2QLJIvQsgOMY4Y4BNNU=;
 b=IKe11lKA37NBCyoKqKj7NZ72mosfO2HZ5EnaM1+fIn0lytfwVykJaiOC9jc1uYszBV
 ffr+TmPj50S5pUd9f5XXKg/Y+nx5DLA7O9zd1UgZKpyaxVTMz+0okzj9+MPZ0JssyBVP
 Qy2qRfcHzbe1+LpZ5fn3SOCiySG2MrDVsve+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QfacSKx5YvhMZbQUK3CWKg7i2QLJIvQsgOMY4Y4BNNU=;
 b=nhNiRoaCoEkA+mGBVQxz9hnm0LA2Islj7fNVKOmlC775iZ3D2Mgad0zmLfB67q0b6S
 Vd6PcPX9ADw94TIeZsY17ptY35S52BWbG7cCUERbVV8NnRYo2QVwrxezgSq5YIYHEyji
 1hNVT3k5W5jrnwN6mNFHZ0nt93TmFhbuJC9ef+oIZYYR8RWGCPyQ4PVlmSLqCO0sozNK
 DNjIgxTwGKdcKOInVdtlCkMC8hzy3VC7eIE1iC/t8J/hViU/PJFflRzeG/ndpQeRQZ57
 sRhW0r2n+MuZ/zoNrtzg1DxRLGOkLizmL/AyhEWTDT4ek07a5lsqMEuDXxCQDJrL40u6
 b4Ig==
X-Gm-Message-State: APjAAAVHqSHEiHGoz8fECV+vxNBZ+2829aNYsxcT9JZ8Lh/cU0E2K5qv
 GNOEsqJAa1X60oFBdotREMSDgg==
X-Google-Smtp-Source: APXvYqw/hf+fwQBT8AvI3QcnlZ5L7Jlgdjd2+s6w3G8DxqZXZbLt2Sf9HW8HjIMLMFBqKgKgM2hMvw==
X-Received: by 2002:a92:d185:: with SMTP id z5mr14146977ilz.132.1579805310374; 
 Thu, 23 Jan 2020 10:48:30 -0800 (PST)
Received: from kiwi.bld.corp.google.com ([2620:15c:183:0:8223:87c:a681:66aa])
 by smtp.gmail.com with ESMTPSA id
 u16sm860662iln.40.2020.01.23.10.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 10:48:29 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Thu, 23 Jan 2020 11:48:03 -0700
Message-Id: <20200123184826.116850-1-sjg@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Cc: Robert Beckett <bob.beckett@collabora.com>, Michal Simek <monstr@monstr.eu>,
 Jun Chen <ptchentw@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Simon Glass <sjg@chromium.org>,
 Lukasz Majewski <lukma@denx.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Heiko Schocher <hs@denx.de>
Subject: [Uboot-stm32] [PATCH v3 00/23] i2c: designware_ic2: Improvements to
	timing and general cleanup
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

This series updates the Designware I2C driver to support reading its
timing from the device tree and handling it in units of nanoseconds
instead of clock cycles.

A new function converts from nanoseconds to the units used by the I2C
controller and makes sure that the requested bus speed is not exceeded.
This is more accurate than the existing method.

The series includes a few smaller clean-ups in the same driver.

In addition the v2 series adds enums for i2c speed and updates drivers to
use them.

There is currently an existing configuration method used just for a few
x86 boards (Baytrail). This method is retained but it should be removed in
favour of using the device tree. I have not done this in this series since
I am not sure of the timings to use.

Changes in v3:
- Fix the address of comp_param1 by adding a gap
- Drop note about moving to driver model
- Use ARRAY_SIZE() for i2c_specs bounds check
- Add new patch with support for fast-plus speed
- Add new patch to move dw_i2c_speed_config to header
- Add new patch to separate out the speed calculation
- Add new patch to do more in the probe() method

Changes in v2:
- Fix 'previde' typo
- Add a few more clean-up patches for i2c

Simon Glass (23):
  i2c: designware_i2c: Add more registers
  i2c: designware_i2c: Don't allow changing IC_CLK
  i2c: designware_i2c: Include clk.h in the header file
  i2c: designware_i2c: Rename 'max' speed to 'high' speed
  i2c: designware_i2c: Use an enum for selected speed mode
  i2c: designware_i2c: Use an accurate bus clock instead of MHz
  i2c: designware_i2c: Bring in the binding file
  i2c: designware_i2c: Read device-tree properties
  i2c: designware_i2c: Drop scl_sda_cfg parameter
  i2c: designware_i2c: Put hold config in a struct
  i2c: designware_i2c: Rewrite timing calculation
  i2c: designware_i2c: Add spike supression
  i2c: Add enums for i2c speed and address size
  i2c: ast_i2c: Update to use standard enums for speed
  i2c: designware_i2c: Update to use standard enums for speed
  i2c: kona_i2c: Update to use standard enums for speed
  i2c: omap: Update to use standard enums for speed
  i2c: stm32: Update to use standard enums for speed
  i2c: Update drivers to use enum for speed
  i2c: designware_i2c: Add support for fast-plus speed
  i2c: designware_i2c: Move dw_i2c_speed_config to header
  i2c: designware_i2c: Separate out the speed calculation
  i2c: designware_i2c: Do more in the probe() method

 .../i2c/i2c-designware.txt                    |  73 +++++
 drivers/i2c/ast_i2c.c                         |   2 +-
 drivers/i2c/ast_i2c.h                         |   2 -
 drivers/i2c/designware_i2c.c                  | 300 ++++++++++++++----
 drivers/i2c/designware_i2c.h                  |  73 ++++-
 drivers/i2c/designware_i2c_pci.c              |   4 +-
 drivers/i2c/exynos_hs_i2c.c                   |   5 +-
 drivers/i2c/fsl_i2c.c                         |   3 +-
 drivers/i2c/i2c-cdns.c                        |   2 +-
 drivers/i2c/i2c-uclass.c                      |  12 +-
 drivers/i2c/i2c-uniphier-f.c                  |   2 +-
 drivers/i2c/i2c-uniphier.c                    |   2 +-
 drivers/i2c/imx_lpi2c.c                       |   8 +-
 drivers/i2c/kona_i2c.c                        |  28 +-
 drivers/i2c/mv_i2c.c                          |   4 +-
 drivers/i2c/mvtwsi.c                          |   5 +-
 drivers/i2c/omap24xx_i2c.c                    |   5 +-
 drivers/i2c/omap24xx_i2c.h                    |   4 -
 drivers/i2c/rcar_i2c.c                        |   2 +-
 drivers/i2c/rcar_iic.c                        |   2 +-
 drivers/i2c/s3c24x0_i2c.c                     |   5 +-
 drivers/i2c/sandbox_i2c.c                     |   3 +-
 drivers/i2c/stm32f7_i2c.c                     |  43 +--
 include/i2c.h                                 |  26 ++
 24 files changed, 454 insertions(+), 161 deletions(-)
 create mode 100644 doc/device-tree-bindings/i2c/i2c-designware.txt

-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
