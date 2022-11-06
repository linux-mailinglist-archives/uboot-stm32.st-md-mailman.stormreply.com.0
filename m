Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D600161E6EB
	for <lists+uboot-stm32@lfdr.de>; Sun,  6 Nov 2022 23:40:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 696F4C6334A;
	Sun,  6 Nov 2022 22:40:20 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70FC0C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  6 Nov 2022 22:40:19 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id o13so5074115ilq.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 06 Nov 2022 14:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JzrCEcgCn9UF6HB5NkA28i+h0NbeHNPq3y0KV77fhDE=;
 b=Ry7RYxPLgMYwev7yr58NX0pM619rlphaX3LV7VijH1ioS2mfA1//X6NHmdFjFuAo3a
 KcYX8jnKO7Zd358Z6kLnW/ZHzShCweSJt/aB9m3JHBSCiglAUf7hEYmEonjWYYOlMM93
 NIh9rFcrRd5Es4yu4aOZNUPYwdBnm9VUhBzt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JzrCEcgCn9UF6HB5NkA28i+h0NbeHNPq3y0KV77fhDE=;
 b=0AxA8+oszV9Lj25CSVuKDlvQlGAzhjC1ZOQwcxCJMP+lQgCkWctKOZfxgBtF1QO2lD
 bf4AYKJlaQGxcEk2eHu4ZU7ceaJgXvd/9HLez2H3z0rJmE8kcNTLnMiO/MSnmwe3d8ZX
 Ugy/rJS8J+s2dV/uIBd3qiNInVlZn8fbqTDD5jPUi6WIFy1JZpIkpHA1+pIs6xT7FZdc
 qGikwcvKCkDLriOPHY1Hopp5H/CxCy5BXOC/Ny20GFHZ0+Kz8HpDBsE1tiz/Ea4D1Izq
 Mmob2rXRqCPXrDEteq8L+4GMFxSI19SkAMOXThuzaRqEpOgZb6X8p7hoxX4/MnXhjA63
 Ux2w==
X-Gm-Message-State: ACrzQf2dCMQ2THuRKIwebznzDZ8WG6Uu6EAnAlXsdR05dDMMOl+VTKX6
 pSbqa2C1HRuq9/TrdhUTe5trNA==
X-Google-Smtp-Source: AMsMyM4daJa4TX0xl6nV2Ci2hP9UtzTqvIp9ItkCAOEC8WF29pWkyO9RISLLlRAxjhOPehMGDfmRSA==
X-Received: by 2002:a05:6e02:134e:b0:300:e88b:bdec with SMTP id
 k14-20020a056e02134e00b00300e88bbdecmr8641785ilr.321.1667774418235; 
 Sun, 06 Nov 2022 14:40:18 -0800 (PST)
Received: from sjg1.roam.corp.google.com
 (c-67-190-102-125.hsd1.co.comcast.net. [67.190.102.125])
 by smtp.gmail.com with ESMTPSA id
 u192-20020a0223c9000000b00363b8ef4bc5sm2021742jau.71.2022.11.06.14.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Nov 2022 14:40:17 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Date: Sun,  6 Nov 2022 15:40:03 -0700
Message-Id: <20221106224011.606743-1-sjg@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
MIME-Version: 1.0
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
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Tom Rini <trini@konsulko.com>, Chee Tien Fong <tien.fong.chee@intel.com>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>,
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
 Simon Glass <sjg@chromium.org>, Lukasz Majewski <lukma@denx.de>,
 "Andrew F. Davis" <afd@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Michael Walle <michael@walle.cc>, Rajesh Bhagat <rajesh.bhagat@nxp.com>,
 Peter Geis <pgwipeout@gmail.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Bin Meng <bmeng.cn@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 u-boot@dh-electronics.com
Subject: [Uboot-stm32] [PATCH v4 0/7] binman: rockchip: Migrate from
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

At present rockchip 64-bit boards make use of a FIT-generator script
written in Python. The script supports splitting an ELF file into several
'loadable' nodes in the FIT. Binman does not current support this feature.

This series adds binman support for ELF splitting. This works by adding a
new 'fit,operation' property to the FIT subnodes, allowing this new way of
generating nodes.

Some other fixes and improvements are needed along the way.

A new, common binman description is added for 64-bit boards which includes
the required u-boot.itb file.

The existing script is removed, so that only a few zynq boards are now
using a SPL_FIT_GENERATOR script:

   avnet_ultrazedev_cc_v1_0_ultrazedev_som_v1_0
   xilinx_zynqmp_virt

Migration of those is hopefully in progress.

Note however that tools/k3_fit_atf.sh remains, used by a few boards that
enable CONFIG_TI_SECURE_DEVICE so this series is copied there too:

    am335x_hs_evm
    am335x_hs_evm_uart
    am43xx_hs_evm
    am57xx_hs_evm
    am57xx_hs_evm_usb
    am65x_hs_evm_a53
    am65x_hs_evm_r5
    dra7xx_hs_evm
    dra7xx_hs_evm_usb
    j721e_hs_evm_a72
    j721e_hs_evm_r5
    k2e_hs_evm
    k2g_hs_evm
    k2hk_hs_evm
    k2l_hs_evm

Ivan Mikhaylov has sent a patch to help with these, but I need to take a
look at the testing side. In any case they should really be using binman
for the image generation.

Changes in v4:
- Add new patch to disable USE_SPL_FIT_GENERATOR by default

Changes in v3:
- Add an offset to the FIT description
- Add support for writing sections in binman
- Rebase to master

Changes in v2:
- Rename op-tee to tee-os
- Drop use of .itb2
- Drop patches previously applied
- Add various suggestions from Alper Nebi Yasak
- Add patches to refactor binman's FIT support

Simon Glass (7):
  binman: Allow writing section contents to a file
  rockchip: evb-rk3288: Drop raw-image support
  rockchip: Include binman script in 64-bit boards
  rockchip: Support building the all output files in binman
  rockchip: Convert all boards to use binman
  rockchip: Drop the FIT generator script
  treewide: Disable USE_SPL_FIT_GENERATOR by default

 Makefile                                      |  11 +-
 arch/arm/dts/rk3368-u-boot.dtsi               |   1 +
 arch/arm/dts/rk3399-puma-haikou-u-boot.dtsi   |   2 +-
 arch/arm/dts/rk3399-u-boot.dtsi               |   3 +
 arch/arm/dts/rockchip-u-boot.dtsi             |  73 ++++-
 arch/arm/mach-rockchip/Kconfig                |   6 +
 arch/arm/mach-rockchip/make_fit_atf.py        | 267 ------------------
 boot/Kconfig                                  |   6 +-
 configs/am335x_evm_defconfig                  |   1 -
 configs/am335x_hs_evm_defconfig               |   1 -
 configs/am335x_hs_evm_uart_defconfig          |   1 -
 configs/am43xx_evm_defconfig                  |   1 -
 configs/am43xx_evm_rtconly_defconfig          |   1 -
 configs/am43xx_evm_usbhost_boot_defconfig     |   1 -
 configs/am43xx_hs_evm_defconfig               |   1 -
 configs/am57xx_evm_defconfig                  |   1 -
 configs/am57xx_hs_evm_defconfig               |   1 -
 configs/am57xx_hs_evm_usb_defconfig           |   1 -
 configs/am65x_evm_a53_defconfig               |   1 -
 configs/am65x_evm_r5_defconfig                |   1 -
 configs/am65x_hs_evm_a53_defconfig            |   1 -
 configs/am65x_hs_evm_r5_defconfig             |   1 -
 ...edev_cc_v1_0_ultrazedev_som_v1_0_defconfig |   1 +
 configs/cgtqmx8_defconfig                     |   1 -
 configs/chromebook_link64_defconfig           |   1 -
 configs/dh_imx6_defconfig                     |   1 -
 configs/display5_defconfig                    |   1 -
 configs/display5_factory_defconfig            |   1 -
 configs/dra7xx_evm_defconfig                  |   1 -
 configs/dra7xx_hs_evm_defconfig               |   1 -
 configs/dra7xx_hs_evm_usb_defconfig           |   1 -
 configs/evb-ast2600_defconfig                 |   1 -
 configs/evb-rk3229_defconfig                  |   1 -
 configs/evb-rk3288_defconfig                  |   2 +-
 configs/gwventana_emmc_defconfig              |   1 -
 configs/gwventana_gw5904_defconfig            |   1 -
 configs/gwventana_nand_defconfig              |   1 -
 configs/imx6qdl_icore_mipi_defconfig          |   1 -
 configs/imx6qdl_icore_mmc_defconfig           |   1 -
 configs/imx6qdl_icore_rqs_defconfig           |   1 -
 configs/imx8mm-cl-iot-gate-optee_defconfig    |   1 -
 configs/imx8mm-cl-iot-gate_defconfig          |   1 -
 configs/imx8mm-icore-mx8mm-ctouch2_defconfig  |   1 -
 configs/imx8mm-icore-mx8mm-edimm2.2_defconfig |   1 -
 configs/imx8mm-mx8menlo_defconfig             |   1 -
 configs/imx8mm_beacon_defconfig               |   1 -
 configs/imx8mm_data_modul_edm_sbc_defconfig   |   1 -
 configs/imx8mm_evk_defconfig                  |   1 -
 configs/imx8mm_evk_fspi_defconfig             |   1 -
 configs/imx8mm_venice_defconfig               |   1 -
 configs/imx8mn_beacon_2g_defconfig            |   1 -
 configs/imx8mn_beacon_defconfig               |   1 -
 configs/imx8mn_bsh_smm_s2_defconfig           |   1 -
 configs/imx8mn_bsh_smm_s2pro_defconfig        |   1 -
 configs/imx8mn_ddr4_evk_defconfig             |   1 -
 configs/imx8mn_evk_defconfig                  |   1 -
 configs/imx8mn_var_som_defconfig              |   1 -
 configs/imx8mn_venice_defconfig               |   1 -
 configs/imx8mp-icore-mx8mp-edimm2.2_defconfig |   1 -
 configs/imx8mp_dhcom_pdk2_defconfig           |   1 -
 configs/imx8mp_evk_defconfig                  |   1 -
 configs/imx8mp_rsb3720a1_4G_defconfig         |   1 -
 configs/imx8mp_rsb3720a1_6G_defconfig         |   1 -
 configs/imx8mp_venice_defconfig               |   1 -
 configs/imx8mq_cm_defconfig                   |   1 -
 configs/imx8mq_evk_defconfig                  |   1 -
 configs/imx8mq_phanbell_defconfig             |   1 -
 configs/imx8qm_rom7720_a1_4G_defconfig        |   1 -
 configs/iot2050_defconfig                     |   1 -
 configs/j7200_evm_a72_defconfig               |   1 -
 configs/j7200_evm_r5_defconfig                |   1 -
 configs/j7200_hs_evm_a72_defconfig            |   1 -
 configs/j7200_hs_evm_r5_defconfig             |   1 -
 configs/j721e_evm_a72_defconfig               |   1 -
 configs/j721e_evm_r5_defconfig                |   1 -
 configs/j721e_hs_evm_a72_defconfig            |   1 -
 configs/j721e_hs_evm_r5_defconfig             |   1 -
 configs/j721s2_evm_a72_defconfig              |   1 -
 configs/j721s2_evm_r5_defconfig               |   1 -
 configs/j721s2_hs_evm_a72_defconfig           |   1 -
 configs/j721s2_hs_evm_r5_defconfig            |   1 -
 configs/kontron-sl-mx6ul_defconfig            |   1 -
 configs/kontron-sl-mx8mm_defconfig            |   1 -
 configs/kontron_pitx_imx8m_defconfig          |   1 -
 configs/kontron_sl28_defconfig                |   1 -
 configs/librem5_defconfig                     |   1 -
 configs/ls1046ardb_qspi_spl_defconfig         |   1 -
 configs/mccmon6_nor_defconfig                 |   1 -
 configs/mccmon6_sd_defconfig                  |   1 -
 configs/mx6sabreauto_defconfig                |   1 -
 configs/mx6sabresd_defconfig                  |   1 -
 configs/phycore-imx8mm_defconfig              |   1 -
 configs/phycore-imx8mp_defconfig              |   1 -
 configs/pico-imx6_defconfig                   |   1 -
 configs/pico-imx8mq_defconfig                 |   1 -
 configs/qemu-x86_64_defconfig                 |   1 -
 configs/sandbox_noinst_defconfig              |   1 -
 configs/sandbox_spl_defconfig                 |   1 -
 configs/sandbox_vpl_defconfig                 |   1 -
 configs/socfpga_agilex_atf_defconfig          |   1 -
 configs/socfpga_agilex_vab_defconfig          |   1 -
 configs/socfpga_arria10_defconfig             |   1 -
 configs/socfpga_chameleonv3_defconfig         |   1 -
 configs/socfpga_n5x_atf_defconfig             |   1 -
 configs/socfpga_n5x_vab_defconfig             |   1 -
 configs/socfpga_stratix10_atf_defconfig       |   1 -
 configs/stm32mp15_dhcom_basic_defconfig       |   1 -
 configs/stm32mp15_dhcor_basic_defconfig       |   1 -
 configs/verdin-imx8mm_defconfig               |   1 -
 configs/verdin-imx8mp_defconfig               |   1 -
 configs/wandboard_defconfig                   |   1 -
 configs/xilinx_zynq_virt_defconfig            |   1 -
 configs/xilinx_zynqmp_virt_defconfig          |   1 +
 tools/binman/binman.rst                       |   5 +
 tools/binman/etype/section.py                 |  12 +-
 tools/binman/ftest.py                         |  14 +
 tools/binman/image.py                         |   3 -
 tools/binman/test/261_section_fname.dts       |  29 ++
 118 files changed, 145 insertions(+), 393 deletions(-)
 delete mode 100755 arch/arm/mach-rockchip/make_fit_atf.py
 create mode 100644 tools/binman/test/261_section_fname.dts

-- 
2.38.1.431.g37b22c650d-goog

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
