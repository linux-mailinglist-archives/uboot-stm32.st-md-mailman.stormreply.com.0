Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E890236A4
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 15:00:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C068C0D2A3
	for <lists+uboot-stm32@lfdr.de>; Mon, 20 May 2019 13:00:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95F77C5C85F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 May 2019 13:00:18 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4KCfBc1021280; Mon, 20 May 2019 15:00:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=kVREJoRQTfKfh5iyXgNXJj/jRA/3qeQIHDtdZqzPxqQ=;
 b=f04kffgy+IbQ0HMgCTjZk0ndof/O5Z7mw7/CHpsx6IXA1MC0sy3BIl7znsLX9AJCS0Gk
 xCrTxghLbuOnBNh/NWcDPrPMt0uIFd7Hn25XGc1r++Wa0hRJTJQTBBpAVxyapRBGIdJw
 UZ6KEDle+pfuCvCIe60AG6BlkG6K73Iu/97U2/ld0EqG57prh5Ll9bdKl+22pN730hVM
 4op9zqETzdiVMPkwTxWOYEDuR/7Ug5/GE0lEPHP+1DJTrGVhyKu02RHgFCaC60BcPwAY
 I32u3A34ajcmcDu7Dp/Ze63T2uQt0UOcqFW8xnmca6PAkx/rcNXDC+azoWXVC1QQd4Cx dA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sj7ttukv6-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 20 May 2019 15:00:16 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CFBD331;
 Mon, 20 May 2019 13:00:14 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B07E028AF;
 Mon, 20 May 2019 13:00:14 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May
 2019 15:00:14 +0200
Received: from localhost (10.201.23.85) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 20 May 2019 15:00:14
 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 20 May 2019 15:00:00 +0200
Message-ID: <1558357207-7345-2-git-send-email-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
References: <1558357207-7345-1-git-send-email-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.85]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-20_06:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Mario Six <mario.six@gdsys.cc>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH v2 1/8] sandbox: add config for SPL boot with
	devicetree
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

Creates defconfig sandbox_spl_dtb_defconfig, same than
sandbox_spl_defconfig but without CONFIG_SPL_OF_PLATDATA;
to allow SPL compilation:
- OF_HOSTFILE is changed to OF_EMBED.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

Changes in v2:
- add sandbox_spl_dtb_defconfig for test

 board/sandbox/MAINTAINERS         |   1 +
 configs/sandbox_spl_dtb_defconfig | 199 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 configs/sandbox_spl_dtb_defconfig

diff --git a/board/sandbox/MAINTAINERS b/board/sandbox/MAINTAINERS
index df29abe..1582a60 100644
--- a/board/sandbox/MAINTAINERS
+++ b/board/sandbox/MAINTAINERS
@@ -26,6 +26,7 @@ S:	Maintained
 F:	board/sandbox/
 F:	include/configs/sandbox_spl.h
 F:	configs/sandbox_spl_defconfig
+F:	configs/sandbox_spl_dtb_defconfig
 
 SANDBOX FLAT TREE BOARD
 M:	Simon Glass <sjg@chromium.org>
diff --git a/configs/sandbox_spl_dtb_defconfig b/configs/sandbox_spl_dtb_defconfig
new file mode 100644
index 0000000..895af0a
--- /dev/null
+++ b/configs/sandbox_spl_dtb_defconfig
@@ -0,0 +1,199 @@
+CONFIG_SYS_TEXT_BASE=0
+CONFIG_SPL_LIBCOMMON_SUPPORT=y
+CONFIG_SPL_LIBGENERIC_SUPPORT=y
+CONFIG_SPL_SERIAL_SUPPORT=y
+CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
+CONFIG_NR_DRAM_BANKS=1
+CONFIG_SPL=y
+CONFIG_SANDBOX_SPL=y
+CONFIG_DISTRO_DEFAULTS=y
+CONFIG_FIT=y
+CONFIG_FIT_SIGNATURE=y
+CONFIG_FIT_VERBOSE=y
+CONFIG_SPL_LOAD_FIT=y
+CONFIG_BOOTSTAGE=y
+CONFIG_BOOTSTAGE_REPORT=y
+CONFIG_BOOTSTAGE_FDT=y
+CONFIG_BOOTSTAGE_STASH=y
+CONFIG_BOOTSTAGE_STASH_ADDR=0x0
+CONFIG_BOOTSTAGE_STASH_SIZE=0x4096
+CONFIG_CONSOLE_RECORD=y
+CONFIG_CONSOLE_RECORD_OUT_SIZE=0x1000
+CONFIG_SILENT_CONSOLE=y
+CONFIG_DISPLAY_BOARDINFO_LATE=y
+CONFIG_HANDOFF=y
+CONFIG_SPL_BOARD_INIT=y
+CONFIG_SPL_ENV_SUPPORT=y
+CONFIG_CMD_CPU=y
+CONFIG_CMD_LICENSE=y
+CONFIG_CMD_BOOTZ=y
+# CONFIG_CMD_ELF is not set
+CONFIG_CMD_ASKENV=y
+CONFIG_CMD_GREPENV=y
+CONFIG_CMD_ENV_CALLBACK=y
+CONFIG_CMD_ENV_FLAGS=y
+CONFIG_LOOPW=y
+CONFIG_CMD_MD5SUM=y
+CONFIG_CMD_MEMINFO=y
+CONFIG_CMD_MEMTEST=y
+CONFIG_CMD_MX_CYCLIC=y
+CONFIG_CMD_DEMO=y
+CONFIG_CMD_GPIO=y
+CONFIG_CMD_GPT=y
+CONFIG_CMD_IDE=y
+CONFIG_CMD_I2C=y
+CONFIG_CMD_OSD=y
+CONFIG_CMD_PCI=y
+CONFIG_CMD_REMOTEPROC=y
+CONFIG_CMD_SF=y
+CONFIG_CMD_SPI=y
+CONFIG_CMD_USB=y
+CONFIG_CMD_TFTPPUT=y
+CONFIG_CMD_TFTPSRV=y
+CONFIG_CMD_RARP=y
+CONFIG_CMD_CDP=y
+CONFIG_CMD_SNTP=y
+CONFIG_CMD_DNS=y
+CONFIG_CMD_LINK_LOCAL=y
+CONFIG_CMD_BMP=y
+CONFIG_CMD_TIME=y
+CONFIG_CMD_TIMER=y
+CONFIG_CMD_SOUND=y
+CONFIG_CMD_QFW=y
+CONFIG_CMD_BOOTSTAGE=y
+CONFIG_CMD_PMIC=y
+CONFIG_CMD_REGULATOR=y
+CONFIG_CMD_TPM=y
+CONFIG_CMD_TPM_TEST=y
+CONFIG_CMD_CBFS=y
+CONFIG_CMD_CRAMFS=y
+CONFIG_CMD_EXT4_WRITE=y
+CONFIG_MAC_PARTITION=y
+CONFIG_AMIGA_PARTITION=y
+CONFIG_OF_CONTROL=y
+CONFIG_SPL_OF_CONTROL=y
+CONFIG_OF_EMBED=y
+CONFIG_DEFAULT_DEVICE_TREE="sandbox"
+CONFIG_NETCONSOLE=y
+CONFIG_SPL_DM=y
+CONFIG_REGMAP=y
+CONFIG_SPL_REGMAP=y
+CONFIG_SYSCON=y
+CONFIG_SPL_SYSCON=y
+CONFIG_DEVRES=y
+CONFIG_DEBUG_DEVRES=y
+# CONFIG_SPL_SIMPLE_BUS is not set
+CONFIG_ADC=y
+CONFIG_ADC_SANDBOX=y
+CONFIG_CLK=y
+CONFIG_CPU=y
+CONFIG_DM_DEMO=y
+CONFIG_DM_DEMO_SIMPLE=y
+CONFIG_DM_DEMO_SHAPE=y
+CONFIG_BOARD=y
+CONFIG_BOARD_SANDBOX=y
+CONFIG_PM8916_GPIO=y
+CONFIG_SANDBOX_GPIO=y
+CONFIG_DM_I2C_COMPAT=y
+CONFIG_I2C_CROS_EC_TUNNEL=y
+CONFIG_I2C_CROS_EC_LDO=y
+CONFIG_DM_I2C_GPIO=y
+CONFIG_SYS_I2C_SANDBOX=y
+CONFIG_I2C_MUX=y
+CONFIG_SPL_I2C_MUX=y
+CONFIG_I2C_ARB_GPIO_CHALLENGE=y
+CONFIG_CROS_EC_KEYB=y
+CONFIG_I8042_KEYB=y
+CONFIG_LED=y
+CONFIG_LED_BLINK=y
+CONFIG_LED_GPIO=y
+CONFIG_DM_MAILBOX=y
+CONFIG_SANDBOX_MBOX=y
+CONFIG_MISC=y
+CONFIG_CROS_EC=y
+CONFIG_CROS_EC_I2C=y
+CONFIG_CROS_EC_LPC=y
+CONFIG_CROS_EC_SANDBOX=y
+CONFIG_CROS_EC_SPI=y
+CONFIG_PWRSEQ=y
+CONFIG_SPL_PWRSEQ=y
+CONFIG_MMC_SANDBOX=y
+CONFIG_SPI_FLASH_SANDBOX=y
+CONFIG_SPI_FLASH=y
+CONFIG_SPI_FLASH_ATMEL=y
+CONFIG_SPI_FLASH_EON=y
+CONFIG_SPI_FLASH_GIGADEVICE=y
+CONFIG_SPI_FLASH_MACRONIX=y
+CONFIG_SPI_FLASH_SPANSION=y
+CONFIG_SPI_FLASH_STMICRO=y
+CONFIG_SPI_FLASH_SST=y
+CONFIG_SPI_FLASH_WINBOND=y
+CONFIG_DM_ETH=y
+CONFIG_NVME=y
+CONFIG_PCI=y
+CONFIG_DM_PCI=y
+CONFIG_DM_PCI_COMPAT=y
+CONFIG_PCI_SANDBOX=y
+CONFIG_PHY=y
+CONFIG_PHY_SANDBOX=y
+CONFIG_PINCTRL=y
+CONFIG_PINCONF=y
+CONFIG_PINCTRL_SANDBOX=y
+CONFIG_DM_PMIC=y
+CONFIG_PMIC_ACT8846=y
+CONFIG_DM_PMIC_PFUZE100=y
+CONFIG_DM_PMIC_MAX77686=y
+CONFIG_DM_PMIC_MC34708=y
+CONFIG_PMIC_PM8916=y
+CONFIG_PMIC_RK8XX=y
+CONFIG_PMIC_S2MPS11=y
+CONFIG_DM_PMIC_SANDBOX=y
+CONFIG_PMIC_S5M8767=y
+CONFIG_PMIC_TPS65090=y
+CONFIG_DM_REGULATOR=y
+CONFIG_REGULATOR_ACT8846=y
+CONFIG_DM_REGULATOR_PFUZE100=y
+CONFIG_DM_REGULATOR_MAX77686=y
+CONFIG_DM_REGULATOR_FIXED=y
+CONFIG_REGULATOR_RK8XX=y
+CONFIG_REGULATOR_S5M8767=y
+CONFIG_DM_REGULATOR_SANDBOX=y
+CONFIG_REGULATOR_TPS65090=y
+CONFIG_DM_PWM=y
+CONFIG_PWM_SANDBOX=y
+CONFIG_RAM=y
+CONFIG_REMOTEPROC_SANDBOX=y
+CONFIG_DM_RESET=y
+CONFIG_SANDBOX_RESET=y
+CONFIG_DM_RTC=y
+CONFIG_SANDBOX_SERIAL=y
+CONFIG_SOUND=y
+CONFIG_SOUND_SANDBOX=y
+CONFIG_SANDBOX_SPI=y
+CONFIG_SPMI=y
+CONFIG_SPMI_SANDBOX=y
+CONFIG_SYSRESET=y
+CONFIG_SPL_SYSRESET=y
+CONFIG_TIMER=y
+CONFIG_TIMER_EARLY=y
+CONFIG_SANDBOX_TIMER=y
+CONFIG_USB=y
+CONFIG_DM_USB=y
+CONFIG_USB_EMUL=y
+CONFIG_USB_KEYBOARD=y
+CONFIG_DM_VIDEO=y
+CONFIG_CONSOLE_ROTATION=y
+CONFIG_CONSOLE_TRUETYPE=y
+CONFIG_CONSOLE_TRUETYPE_CANTORAONE=y
+CONFIG_VIDEO_SANDBOX_SDL=y
+CONFIG_OSD=y
+CONFIG_SANDBOX_OSD=y
+CONFIG_FS_CBFS=y
+CONFIG_FS_CRAMFS=y
+CONFIG_CMD_DHRYSTONE=y
+CONFIG_TPM=y
+CONFIG_LZ4=y
+CONFIG_ERRNO_STR=y
+CONFIG_UNIT_TEST=y
+CONFIG_UT_TIME=y
+CONFIG_UT_DM=y
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
