Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC014C76A
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jan 2020 09:25:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22EBCC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 29 Jan 2020 08:25:14 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D738C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2020 06:00:55 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 486tBp0bWkz1rXvw;
 Wed, 29 Jan 2020 07:00:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 486tBn695jz1qr2W;
 Wed, 29 Jan 2020 07:00:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id YaXlws65EAJA; Wed, 29 Jan 2020 07:00:47 +0100 (CET)
X-Auth-Info: s0Ed7YidENGLgKpDxwZZo35dSKEYSBXb1FULgBh1db0=
Received: from [192.168.1.106] (213-197-89-185.pool.digikabel.hu
 [213.197.89.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 29 Jan 2020 07:00:47 +0100 (CET)
To: Simon Glass <sjg@chromium.org>
References: <20200123184826.116850-1-sjg@chromium.org>
From: Heiko Schocher <hs@denx.de>
Message-ID: <42ee5912-c0e1-1313-75d7-59d21fccabfa@denx.de>
Date: Wed, 29 Jan 2020 07:00:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20200123184826.116850-1-sjg@chromium.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 29 Jan 2020 08:25:12 +0000
Cc: Robert Beckett <bob.beckett@collabora.com>, Michal Simek <monstr@monstr.eu>,
 Jun Chen <ptchentw@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Lukasz Majewski <lukma@denx.de>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [Uboot-stm32] [PATCH v3 00/23] i2c: designware_ic2:
 Improvements to timing and general cleanup
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
Reply-To: hs@denx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Simon,

Am 23.01.2020 um 19:48 schrieb Simon Glass:
> This series updates the Designware I2C driver to support reading its
> timing from the device tree and handling it in units of nanoseconds
> instead of clock cycles.
> 
> A new function converts from nanoseconds to the units used by the I2C
> controller and makes sure that the requested bus speed is not exceeded.
> This is more accurate than the existing method.
> 
> The series includes a few smaller clean-ups in the same driver.
> 
> In addition the v2 series adds enums for i2c speed and updates drivers to
> use them.
> 
> There is currently an existing configuration method used just for a few
> x86 boards (Baytrail). This method is retained but it should be removed in
> favour of using the device tree. I have not done this in this series since
> I am not sure of the timings to use.
> 
> Changes in v3:
> - Fix the address of comp_param1 by adding a gap
> - Drop note about moving to driver model
> - Use ARRAY_SIZE() for i2c_specs bounds check
> - Add new patch with support for fast-plus speed
> - Add new patch to move dw_i2c_speed_config to header
> - Add new patch to separate out the speed calculation
> - Add new patch to do more in the probe() method
> 
> Changes in v2:
> - Fix 'previde' typo
> - Add a few more clean-up patches for i2c
> 
> Simon Glass (23):
>    i2c: designware_i2c: Add more registers
>    i2c: designware_i2c: Don't allow changing IC_CLK
>    i2c: designware_i2c: Include clk.h in the header file
>    i2c: designware_i2c: Rename 'max' speed to 'high' speed
>    i2c: designware_i2c: Use an enum for selected speed mode
>    i2c: designware_i2c: Use an accurate bus clock instead of MHz
>    i2c: designware_i2c: Bring in the binding file
>    i2c: designware_i2c: Read device-tree properties
>    i2c: designware_i2c: Drop scl_sda_cfg parameter
>    i2c: designware_i2c: Put hold config in a struct
>    i2c: designware_i2c: Rewrite timing calculation
>    i2c: designware_i2c: Add spike supression
>    i2c: Add enums for i2c speed and address size
>    i2c: ast_i2c: Update to use standard enums for speed
>    i2c: designware_i2c: Update to use standard enums for speed
>    i2c: kona_i2c: Update to use standard enums for speed
>    i2c: omap: Update to use standard enums for speed
>    i2c: stm32: Update to use standard enums for speed
>    i2c: Update drivers to use enum for speed
>    i2c: designware_i2c: Add support for fast-plus speed
>    i2c: designware_i2c: Move dw_i2c_speed_config to header
>    i2c: designware_i2c: Separate out the speed calculation
>    i2c: designware_i2c: Do more in the probe() method
> 
>   .../i2c/i2c-designware.txt                    |  73 +++++
>   drivers/i2c/ast_i2c.c                         |   2 +-
>   drivers/i2c/ast_i2c.h                         |   2 -
>   drivers/i2c/designware_i2c.c                  | 300 ++++++++++++++----
>   drivers/i2c/designware_i2c.h                  |  73 ++++-
>   drivers/i2c/designware_i2c_pci.c              |   4 +-
>   drivers/i2c/exynos_hs_i2c.c                   |   5 +-
>   drivers/i2c/fsl_i2c.c                         |   3 +-
>   drivers/i2c/i2c-cdns.c                        |   2 +-
>   drivers/i2c/i2c-uclass.c                      |  12 +-
>   drivers/i2c/i2c-uniphier-f.c                  |   2 +-
>   drivers/i2c/i2c-uniphier.c                    |   2 +-
>   drivers/i2c/imx_lpi2c.c                       |   8 +-
>   drivers/i2c/kona_i2c.c                        |  28 +-
>   drivers/i2c/mv_i2c.c                          |   4 +-
>   drivers/i2c/mvtwsi.c                          |   5 +-
>   drivers/i2c/omap24xx_i2c.c                    |   5 +-
>   drivers/i2c/omap24xx_i2c.h                    |   4 -
>   drivers/i2c/rcar_i2c.c                        |   2 +-
>   drivers/i2c/rcar_iic.c                        |   2 +-
>   drivers/i2c/s3c24x0_i2c.c                     |   5 +-
>   drivers/i2c/sandbox_i2c.c                     |   3 +-
>   drivers/i2c/stm32f7_i2c.c                     |  43 +--
>   include/i2c.h                                 |  26 ++
>   24 files changed, 454 insertions(+), 161 deletions(-)
>   create mode 100644 doc/device-tree-bindings/i2c/i2c-designware.txt

Applied the hole series to u-boot-i2c master.

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
