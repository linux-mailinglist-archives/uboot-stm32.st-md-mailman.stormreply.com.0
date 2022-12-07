Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F766450C8
	for <lists+uboot-stm32@lfdr.de>; Wed,  7 Dec 2022 02:08:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7E82C65E71;
	Wed,  7 Dec 2022 01:08:44 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3E33C65E70
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Dec 2022 01:08:42 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gh17so10459523ejb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Dec 2022 17:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RRn3d/BZBBYMm8+N0ForMj0A1oHZpS9XVvYBvyQT4ls=;
 b=S1bgEOGDAVRQBAniLLCW4NeDLP1PgGxH6/P9REHjPiltkR5gY2ANfU2kzooU/x7VLg
 0QcWT66hxEBM2G7n7sCZDYUp3lZL+mfxXv4rIcjc+SFEwcR+3OE/pvKuvhQqH+oOWF/R
 0vvb1GP/Lg70/wM/dmA+59xXTFeJ2M6w4W9/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRn3d/BZBBYMm8+N0ForMj0A1oHZpS9XVvYBvyQT4ls=;
 b=ll0WT/rjEB/rgBCODsRDRZxwHQjlf13YFB5xr4d2GimccM89SkUC/RbUDcKDbATPDk
 Y2VAmfBbBMl7b1dnPRBFznaBQ8r5M5f7cawH9ojBswR2/+K9pm2nCNaiNvMZekz6E7Bt
 SirsvS9ffq5nhfBy7mgWFp25CLTSG/s1vesPib15JQXE+oBBgtRSGN/aqwMBOYkgbvco
 ylLSL0GaenoYBp7zM3s9fGYVl0s7xjXHUTVrfIu791uiS6gEAvOZjjLBwcL4l/i8RfCP
 lfsuZbvWiNWJlcBivwbhb46UUlY5OFfSKVXr7lOHd9t7zjfGSETggYGIpG18Fi1knSbx
 SKTg==
X-Gm-Message-State: ANoB5pkXEO73qgoREwp5U4d7e5Fxp2qBHBWRc0TOqhtatvfluWipJHIr
 x3kFsCfMIWnMsicPinFSgVa7YLVXAeXQuwCBqQEldQ==
X-Google-Smtp-Source: AA0mqf4dnUf8xTAHjt0ghBrfIuFJpOSdBSi2c+u5262qcFwekFZpCcoiJ/gL91cOcyH79aec5P6toQWIAzZdK9G3rso=
X-Received: by 2002:a17:906:e87:b0:78d:b88f:1548 with SMTP id
 p7-20020a1709060e8700b0078db88f1548mr77921245ejf.221.1670375321974; Tue, 06
 Dec 2022 17:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20221106224011.606743-1-sjg@chromium.org>
In-Reply-To: <20221106224011.606743-1-sjg@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 7 Dec 2022 14:08:29 +1300
Message-ID: <CAPnjgZ0U=pwxYiPNJddn9Zs_UXrChuvoc7wDVJ_XyU2Z52pB_Q@mail.gmail.com>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Peng Fan <peng.fan@nxp.com>,
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Jan Kiszka <jan.kiszka@siemens.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Angus Ainslie <angus@akkea.ca>, Kever Yang <kever.yang@rock-chips.com>,
 Chin-Liang See <clsee@altera.com>, Ivan Mikhaylov <ivan.mikhaylov@siemens.com>,
 Teresa Remmet <t.remmet@phytec.de>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Olaf Mandel <o.mandel@menlosystems.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Manoj Sai <abbaraju.manojsai@amarulasolutions.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Tomsich <philipp.tomsich@theobroma-systems.com>,
 Fabio Estevam <festevam@gmail.com>,
 "Ying-Chun Liu \(PaulLiu\)" <paul.liu@linaro.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, Tom Rini <trini@konsulko.com>,
 Chee Tien Fong <tien.fong.chee@intel.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 =?UTF-8?Q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, kernel@puri.sm,
 Mingkai Hu <mingkai.hu@nxp.com>, Le Jin <le.jin@siemens.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marco Franchi <marcofrk@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Ilko Iliev <iliev@ronetix.at>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@denx.de>,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>,
 Matteo Lisi <matteo.lisi@engicam.com>, Andre Przywara <andre.przywara@arm.com>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Jeffy Chen <jeffy.chen@rock-chips.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Aswath Govindraju <a-govindraju@ti.com>,
 Chee Hong Ang <chee.hong.ang@intel.com>, Adam Ford <aford173@gmail.com>,
 Alifer Moraes <alifer.wsdm@gmail.com>, Roger Quadros <rogerq@ti.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 huang lin <hl@rock-chips.com>, Siew Chin Lim <elly.siew.chin.lim@intel.com>,
 Lukasz Majewski <lukma@denx.de>, "Andrew F. Davis" <afd@ti.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Walle <michael@walle.cc>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Peter Geis <pgwipeout@gmail.com>,
 Luca Ceresoli <luca@lucaceresoli.net>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH v4 0/7] binman: rockchip: Migrate from
 rockchip SPL_FIT_GENERATOR script
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

Hi Kevar,

On Mon, 7 Nov 2022 at 11:40, Simon Glass <sjg@chromium.org> wrote:
>
> At present rockchip 64-bit boards make use of a FIT-generator script
> written in Python. The script supports splitting an ELF file into several
> 'loadable' nodes in the FIT. Binman does not current support this feature.
>
> This series adds binman support for ELF splitting. This works by adding a
> new 'fit,operation' property to the FIT subnodes, allowing this new way of
> generating nodes.
>
> Some other fixes and improvements are needed along the way.
>
> A new, common binman description is added for 64-bit boards which includes
> the required u-boot.itb file.
>
> The existing script is removed, so that only a few zynq boards are now
> using a SPL_FIT_GENERATOR script:
>
>    avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0
>    xilinx_zynqmp_virt
>
> Migration of those is hopefully in progress.
>
> Note however that tools/k3_fit_atf.sh remains, used by a few boards that
> enable CONFIG_TI_SECURE_DEVICE so this series is copied there too:
>
>     am335x_hs_evm
>     am335x_hs_evm_uart
>     am43xx_hs_evm
>     am57xx_hs_evm
>     am57xx_hs_evm_usb
>     am65x_hs_evm_a53
>     am65x_hs_evm_r5
>     dra7xx_hs_evm
>     dra7xx_hs_evm_usb
>     j721e_hs_evm_a72
>     j721e_hs_evm_r5
>     k2e_hs_evm
>     k2g_hs_evm
>     k2hk_hs_evm
>     k2l_hs_evm
>
> Ivan Mikhaylov has sent a patch to help with these, but I need to take a
> look at the testing side. In any case they should really be using binman
> for the image generation.
>
> Changes in v4:
> - Add new patch to disable USE_SPL_FIT_GENERATOR by default
>
> Changes in v3:
> - Add an offset to the FIT description
> - Add support for writing sections in binman
> - Rebase to master
>
> Changes in v2:
> - Rename op-tee to tee-os
> - Drop use of .itb2
> - Drop patches previously applied
> - Add various suggestions from Alper Nebi Yasak
> - Add patches to refactor binman's FIT support
>
> Simon Glass (7):
>   binman: Allow writing section contents to a file
>   rockchip: evb-rk3288: Drop raw-image support
>   rockchip: Include binman script in 64-bit boards
>   rockchip: Support building the all output files in binman
>   rockchip: Convert all boards to use binman
>   rockchip: Drop the FIT generator script
>   treewide: Disable USE_SPL_FIT_GENERATOR by default
>

Can this one please be applied in time for the release?

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
