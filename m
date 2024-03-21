Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B99988622A
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Mar 2024 22:04:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31534C6DD68;
	Thu, 21 Mar 2024 21:04:06 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A270C6DD68
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 21:04:05 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2d21cdbc85bso22775271fa.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Mar 2024 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711055044; x=1711659844;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MbY1dX7cyFrzOsvuptK0ANOEm622M1jNzSHh8CU98Gg=;
 b=Le0BvV0k5CO71GztdSukH/4qVDjMA+vcFo0OPVjvPvbb0kE6N7zjYh6Q06mqrDkJgh
 e9sl3wSUoTUANNNln92uFy07HYmJovZQvPWSUn5rLHKtdQpdIWsdE6qJoSgH8MeGSp1r
 3OnXW+cUH2d3XiXMyWVSN89UL1RcvMwmshLB3EN+TWyhz19ZuOecC4vOvlXdy+Dn8GJu
 ghWLx5wO+oE3pg4NvOodtZX9YYmfPlPHpsFMwDUyyJOO7YgEgLWwstCGM7W0enmdoHhD
 3tjeMAyhBLpEmROM33s/omy1V7VH5WdZu2/ZTwIhpwvfllRRR0YcpmjUCmda72fu8Zwd
 v6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711055044; x=1711659844;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MbY1dX7cyFrzOsvuptK0ANOEm622M1jNzSHh8CU98Gg=;
 b=X4gSwmwjxsXHfgvUhtTvllF1CvHaQRCKYFx6iWZv3z/Jb5boOB3wp/fUKN5qyOHy/a
 ijsP84ANb36FHBATpM8mSPpZI0VwRU8aIbEHlBkc1Vafc8r4L2G27PZPWWwts7SWvgf/
 GEy6VJ8ax+sE8Sbp1SC5xMG3HiOK8zQgfI4NlPogSKPMYOGVsLoQHKibPoy9Xg21hzER
 Gy2t8Fff1yQKIHTfObteLK0HDgLki3bsO3eEFD3NRO/xf+xFutcfxDlVeDBzA9hWN1OI
 v03codbUfx2mCA3IebAvFnP5FU1WsbPID8sDRp1Ho+kLfSmTFk2eZgq2z70LyUliaU7a
 PNoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZp+d37l/aG9GVetGNiVDlnDhWgGVwlhxrYR3Qtsb6TDgvea98no3Ci2SFcsHoqLz/HhoUUSLkaGVmTU3M1p/9/H/ghtqVRN+4oGDfbIu6h5zwJXbOT5jp
X-Gm-Message-State: AOJu0YydqEOgMZMk6P9Zpq2p9nPPF5yhc6M1+1Le3XcRQr9dHB1dmhW2
 xDxljlBi8dNWDR5mJauVnHeP6nD9s0kwTJ3Lz/+4EVbfjuz81rjt1reZ8HyMDUE=
X-Google-Smtp-Source: AGHT+IGKjIj/SYUv+djwEAV+4zff7foKDkmvSMA3xrtnhVas1EWzGCunCp0ccyixHV8vV3U3Ldde+A==
X-Received: by 2002:a2e:9b5a:0:b0:2d4:3b15:5561 with SMTP id
 o26-20020a2e9b5a000000b002d43b155561mr437459ljj.40.1711055044469; 
 Thu, 21 Mar 2024 14:04:04 -0700 (PDT)
Received: from lion.localdomain (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b004146f728906sm925462wmb.7.2024.03.21.14.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Mar 2024 14:04:02 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
Date: Thu, 21 Mar 2024 21:03:45 +0000
MIME-Version: 1.0
Message-Id: <20240321-b4-upstream-dt-headers-v2-2-1eac0df875fe@linaro.org>
References: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
In-Reply-To: <20240321-b4-upstream-dt-headers-v2-0-1eac0df875fe@linaro.org>
To: Tom Rini <trini@konsulko.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Sumit Garg <sumit.garg@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>, 
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>, 
 Sean Anderson <seanga2@gmail.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Matthias Brugger <mbrugger@suse.com>, Peter Robinson <pbrobinson@gmail.com>, 
 Joe Hershberger <joe.hershberger@ni.com>, 
 Ramon Fried <rfried.dev@gmail.com>, Thierry Reding <treding@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Michal Simek <michal.simek@amd.com>, 
 Paul Barker <paul.barker.ct@bp.renesas.com>, 
 Weijie Gao <weijie.gao@mediatek.com>, 
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Eugen Hristev <eugen.hristev@collabora.com>, Rick Chen <rick@andestech.com>, 
 Leo <ycliang@andestech.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, 
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Dai Okamura <okamura.dai@socionext.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=70820;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=yWlyQmzHCoN3PgwBt57WPrnDQr3/xCdrlCNLCxQ6o5U=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhtQ/C3ZLyx8Jv+LC7Plb/oNVb8WW96bRNvfeRj9oiX/o9
 yD+C+f5jlIWBkEOBlkxRRbxE8ssm9ZettfYvuACzBxWJpAhDFycAjCRe00Mf6W3e25xrRI9VaG6
 1Sv5aOvWuOpZmUDDiiVETZ+UWjtdYGSY1d3gxNqv9vLbPuHglFU790w39Fux+OfJuTtP322sObK
 +GgA=
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com, Caleb Connolly <caleb.connolly@linaro.org>,
 u-boot-amlogic@groups.io
Subject: [Uboot-stm32] [PATCH v2 02/24] qcom: drop remaining dt-binding
	headers
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

Drop in favour of dts/upstream

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 include/dt-bindings/dma/qcom-gpi.h                 |  11 -
 include/dt-bindings/firmware/qcom,scm.h            |  39 --
 include/dt-bindings/iio/qcom,spmi-vadc.h           | 300 ---------------
 include/dt-bindings/interconnect/qcom,msm8916.h    | 100 -----
 .../dt-bindings/interconnect/qcom,msm8996-cbf.h    |  12 -
 include/dt-bindings/interconnect/qcom,msm8996.h    | 163 --------
 include/dt-bindings/interconnect/qcom,osm-l3.h     |  15 -
 include/dt-bindings/interconnect/qcom,sdm845.h     | 150 --------
 include/dt-bindings/phy/phy-qcom-qmp.h             |  20 -
 include/dt-bindings/phy/phy-qcom-qusb2.h           |  37 --
 include/dt-bindings/pinctrl/qcom,pmic-gpio.h       | 164 --------
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h        | 106 ------
 include/dt-bindings/power/qcom-rpmpd.h             | 412 ---------------------
 .../dt-bindings/regulator/qcom,rpmh-regulator.h    |  36 --
 include/dt-bindings/reset/qcom,gcc-msm8916.h       | 100 -----
 include/dt-bindings/reset/qcom,sdm845-aoss.h       |  17 -
 include/dt-bindings/reset/qcom,sdm845-pdc.h        |  22 --
 include/dt-bindings/soc/qcom,apr.h                 |  28 --
 include/dt-bindings/soc/qcom,rpmh-rsc.h            |  14 -
 include/dt-bindings/sound/qcom,lpass.h             |  46 ---
 include/dt-bindings/sound/qcom,q6afe.h             |   9 -
 include/dt-bindings/sound/qcom,q6asm.h             |  26 --
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 234 ------------
 include/dt-bindings/sound/qcom,wcd9335.h           |  15 -
 24 files changed, 2076 deletions(-)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
deleted file mode 100644
index ebda2a37f52a..000000000000
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
-/* Copyright (c) 2020, Linaro Ltd.  */
-
-#ifndef __DT_BINDINGS_DMA_QCOM_GPI_H__
-#define __DT_BINDINGS_DMA_QCOM_GPI_H__
-
-#define QCOM_GPI_SPI		1
-#define QCOM_GPI_UART		2
-#define QCOM_GPI_I2C		3
-
-#endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */
diff --git a/include/dt-bindings/firmware/qcom,scm.h b/include/dt-bindings/firmware/qcom,scm.h
deleted file mode 100644
index 6de8b08e1e79..000000000000
--- a/include/dt-bindings/firmware/qcom,scm.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
-/*
- * Copyright (c) 2010-2015, 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (C) 2015 Linaro Ltd.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_FIRMWARE_QCOM_SCM_H
-#define _DT_BINDINGS_FIRMWARE_QCOM_SCM_H
-
-#define QCOM_SCM_VMID_TZ		0x1
-#define QCOM_SCM_VMID_HLOS		0x3
-#define QCOM_SCM_VMID_SSC_Q6		0x5
-#define QCOM_SCM_VMID_ADSP_Q6		0x6
-#define QCOM_SCM_VMID_CP_TOUCH		0x8
-#define QCOM_SCM_VMID_CP_BITSTREAM	0x9
-#define QCOM_SCM_VMID_CP_PIXEL		0xA
-#define QCOM_SCM_VMID_CP_NON_PIXEL	0xB
-#define QCOM_SCM_VMID_CP_CAMERA		0xD
-#define QCOM_SCM_VMID_HLOS_FREE		0xE
-#define QCOM_SCM_VMID_MSS_MSA		0xF
-#define QCOM_SCM_VMID_MSS_NONMSA	0x10
-#define QCOM_SCM_VMID_CP_SEC_DISPLAY	0x11
-#define QCOM_SCM_VMID_CP_APP		0x12
-#define QCOM_SCM_VMID_LPASS		0x16
-#define QCOM_SCM_VMID_WLAN		0x18
-#define QCOM_SCM_VMID_WLAN_CE		0x19
-#define QCOM_SCM_VMID_CP_SPSS_SP	0x1A
-#define QCOM_SCM_VMID_CP_CAMERA_PREVIEW 0x1D
-#define QCOM_SCM_VMID_CDSP		0x1E
-#define QCOM_SCM_VMID_CP_SPSS_SP_SHARED 0x22
-#define QCOM_SCM_VMID_CP_SPSS_HLOS_SHARED 0x24
-#define QCOM_SCM_VMID_ADSP_HEAP		0x25
-#define QCOM_SCM_VMID_CP_CDSP		0x2A
-#define QCOM_SCM_VMID_NAV		0x2B
-#define QCOM_SCM_VMID_TVM		0x2D
-#define QCOM_SCM_VMID_OEMVM		0x31
-
-#endif
diff --git a/include/dt-bindings/iio/qcom,spmi-vadc.h b/include/dt-bindings/iio/qcom,spmi-vadc.h
deleted file mode 100644
index 08adfe25964c..000000000000
--- a/include/dt-bindings/iio/qcom,spmi-vadc.h
+++ /dev/null
@@ -1,300 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2012-2014,2018,2020 The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_QCOM_SPMI_VADC_H
-#define _DT_BINDINGS_QCOM_SPMI_VADC_H
-
-/* Voltage ADC channels */
-#define VADC_USBIN				0x00
-#define VADC_DCIN				0x01
-#define VADC_VCHG_SNS				0x02
-#define VADC_SPARE1_03				0x03
-#define VADC_USB_ID_MV				0x04
-#define VADC_VCOIN				0x05
-#define VADC_VBAT_SNS				0x06
-#define VADC_VSYS				0x07
-#define VADC_DIE_TEMP				0x08
-#define VADC_REF_625MV				0x09
-#define VADC_REF_1250MV				0x0a
-#define VADC_CHG_TEMP				0x0b
-#define VADC_SPARE1				0x0c
-#define VADC_SPARE2				0x0d
-#define VADC_GND_REF				0x0e
-#define VADC_VDD_VADC				0x0f
-
-#define VADC_P_MUX1_1_1				0x10
-#define VADC_P_MUX2_1_1				0x11
-#define VADC_P_MUX3_1_1				0x12
-#define VADC_P_MUX4_1_1				0x13
-#define VADC_P_MUX5_1_1				0x14
-#define VADC_P_MUX6_1_1				0x15
-#define VADC_P_MUX7_1_1				0x16
-#define VADC_P_MUX8_1_1				0x17
-#define VADC_P_MUX9_1_1				0x18
-#define VADC_P_MUX10_1_1			0x19
-#define VADC_P_MUX11_1_1			0x1a
-#define VADC_P_MUX12_1_1			0x1b
-#define VADC_P_MUX13_1_1			0x1c
-#define VADC_P_MUX14_1_1			0x1d
-#define VADC_P_MUX15_1_1			0x1e
-#define VADC_P_MUX16_1_1			0x1f
-
-#define VADC_P_MUX1_1_3				0x20
-#define VADC_P_MUX2_1_3				0x21
-#define VADC_P_MUX3_1_3				0x22
-#define VADC_P_MUX4_1_3				0x23
-#define VADC_P_MUX5_1_3				0x24
-#define VADC_P_MUX6_1_3				0x25
-#define VADC_P_MUX7_1_3				0x26
-#define VADC_P_MUX8_1_3				0x27
-#define VADC_P_MUX9_1_3				0x28
-#define VADC_P_MUX10_1_3			0x29
-#define VADC_P_MUX11_1_3			0x2a
-#define VADC_P_MUX12_1_3			0x2b
-#define VADC_P_MUX13_1_3			0x2c
-#define VADC_P_MUX14_1_3			0x2d
-#define VADC_P_MUX15_1_3			0x2e
-#define VADC_P_MUX16_1_3			0x2f
-
-#define VADC_LR_MUX1_BAT_THERM			0x30
-#define VADC_LR_MUX2_BAT_ID			0x31
-#define VADC_LR_MUX3_XO_THERM			0x32
-#define VADC_LR_MUX4_AMUX_THM1			0x33
-#define VADC_LR_MUX5_AMUX_THM2			0x34
-#define VADC_LR_MUX6_AMUX_THM3			0x35
-#define VADC_LR_MUX7_HW_ID			0x36
-#define VADC_LR_MUX8_AMUX_THM4			0x37
-#define VADC_LR_MUX9_AMUX_THM5			0x38
-#define VADC_LR_MUX10_USB_ID			0x39
-#define VADC_AMUX_PU1				0x3a
-#define VADC_AMUX_PU2				0x3b
-#define VADC_LR_MUX3_BUF_XO_THERM		0x3c
-
-#define VADC_LR_MUX1_PU1_BAT_THERM		0x70
-#define VADC_LR_MUX2_PU1_BAT_ID			0x71
-#define VADC_LR_MUX3_PU1_XO_THERM		0x72
-#define VADC_LR_MUX4_PU1_AMUX_THM1		0x73
-#define VADC_LR_MUX5_PU1_AMUX_THM2		0x74
-#define VADC_LR_MUX6_PU1_AMUX_THM3		0x75
-#define VADC_LR_MUX7_PU1_AMUX_HW_ID		0x76
-#define VADC_LR_MUX8_PU1_AMUX_THM4		0x77
-#define VADC_LR_MUX9_PU1_AMUX_THM5		0x78
-#define VADC_LR_MUX10_PU1_AMUX_USB_ID		0x79
-#define VADC_LR_MUX3_BUF_PU1_XO_THERM		0x7c
-
-#define VADC_LR_MUX1_PU2_BAT_THERM		0xb0
-#define VADC_LR_MUX2_PU2_BAT_ID			0xb1
-#define VADC_LR_MUX3_PU2_XO_THERM		0xb2
-#define VADC_LR_MUX4_PU2_AMUX_THM1		0xb3
-#define VADC_LR_MUX5_PU2_AMUX_THM2		0xb4
-#define VADC_LR_MUX6_PU2_AMUX_THM3		0xb5
-#define VADC_LR_MUX7_PU2_AMUX_HW_ID		0xb6
-#define VADC_LR_MUX8_PU2_AMUX_THM4		0xb7
-#define VADC_LR_MUX9_PU2_AMUX_THM5		0xb8
-#define VADC_LR_MUX10_PU2_AMUX_USB_ID		0xb9
-#define VADC_LR_MUX3_BUF_PU2_XO_THERM		0xbc
-
-#define VADC_LR_MUX1_PU1_PU2_BAT_THERM		0xf0
-#define VADC_LR_MUX2_PU1_PU2_BAT_ID		0xf1
-#define VADC_LR_MUX3_PU1_PU2_XO_THERM		0xf2
-#define VADC_LR_MUX4_PU1_PU2_AMUX_THM1		0xf3
-#define VADC_LR_MUX5_PU1_PU2_AMUX_THM2		0xf4
-#define VADC_LR_MUX6_PU1_PU2_AMUX_THM3		0xf5
-#define VADC_LR_MUX7_PU1_PU2_AMUX_HW_ID		0xf6
-#define VADC_LR_MUX8_PU1_PU2_AMUX_THM4		0xf7
-#define VADC_LR_MUX9_PU1_PU2_AMUX_THM5		0xf8
-#define VADC_LR_MUX10_PU1_PU2_AMUX_USB_ID	0xf9
-#define VADC_LR_MUX3_BUF_PU1_PU2_XO_THERM	0xfc
-
-/* ADC channels for SPMI PMIC5 */
-
-#define ADC5_REF_GND				0x00
-#define ADC5_1P25VREF				0x01
-#define ADC5_VREF_VADC				0x02
-#define ADC5_VREF_VADC5_DIV_3			0x82
-#define ADC5_VPH_PWR				0x83
-#define ADC5_VBAT_SNS				0x84
-#define ADC5_VCOIN				0x85
-#define ADC5_DIE_TEMP				0x06
-#define ADC5_USB_IN_I				0x07
-#define ADC5_USB_IN_V_16			0x08
-#define ADC5_CHG_TEMP				0x09
-#define ADC5_BAT_THERM				0x0a
-#define ADC5_BAT_ID				0x0b
-#define ADC5_XO_THERM				0x0c
-#define ADC5_AMUX_THM1				0x0d
-#define ADC5_AMUX_THM2				0x0e
-#define ADC5_AMUX_THM3				0x0f
-#define ADC5_AMUX_THM4				0x10
-#define ADC5_AMUX_THM5				0x11
-#define ADC5_GPIO1				0x12
-#define ADC5_GPIO2				0x13
-#define ADC5_GPIO3				0x14
-#define ADC5_GPIO4				0x15
-#define ADC5_GPIO5				0x16
-#define ADC5_GPIO6				0x17
-#define ADC5_GPIO7				0x18
-#define ADC5_SBUx				0x99
-#define ADC5_MID_CHG_DIV6			0x1e
-#define ADC5_OFF				0xff
-
-/* 30k pull-up1 */
-#define ADC5_BAT_THERM_30K_PU			0x2a
-#define ADC5_BAT_ID_30K_PU			0x2b
-#define ADC5_XO_THERM_30K_PU			0x2c
-#define ADC5_AMUX_THM1_30K_PU			0x2d
-#define ADC5_AMUX_THM2_30K_PU			0x2e
-#define ADC5_AMUX_THM3_30K_PU			0x2f
-#define ADC5_AMUX_THM4_30K_PU			0x30
-#define ADC5_AMUX_THM5_30K_PU			0x31
-#define ADC5_GPIO1_30K_PU			0x32
-#define ADC5_GPIO2_30K_PU			0x33
-#define ADC5_GPIO3_30K_PU			0x34
-#define ADC5_GPIO4_30K_PU			0x35
-#define ADC5_GPIO5_30K_PU			0x36
-#define ADC5_GPIO6_30K_PU			0x37
-#define ADC5_GPIO7_30K_PU			0x38
-#define ADC5_SBUx_30K_PU			0x39
-
-/* 100k pull-up2 */
-#define ADC5_BAT_THERM_100K_PU			0x4a
-#define ADC5_BAT_ID_100K_PU			0x4b
-#define ADC5_XO_THERM_100K_PU			0x4c
-#define ADC5_AMUX_THM1_100K_PU			0x4d
-#define ADC5_AMUX_THM2_100K_PU			0x4e
-#define ADC5_AMUX_THM3_100K_PU			0x4f
-#define ADC5_AMUX_THM4_100K_PU			0x50
-#define ADC5_AMUX_THM5_100K_PU			0x51
-#define ADC5_GPIO1_100K_PU			0x52
-#define ADC5_GPIO2_100K_PU			0x53
-#define ADC5_GPIO3_100K_PU			0x54
-#define ADC5_GPIO4_100K_PU			0x55
-#define ADC5_GPIO5_100K_PU			0x56
-#define ADC5_GPIO6_100K_PU			0x57
-#define ADC5_GPIO7_100K_PU			0x58
-#define ADC5_SBUx_100K_PU			0x59
-
-/* 400k pull-up3 */
-#define ADC5_BAT_THERM_400K_PU			0x6a
-#define ADC5_BAT_ID_400K_PU			0x6b
-#define ADC5_XO_THERM_400K_PU			0x6c
-#define ADC5_AMUX_THM1_400K_PU			0x6d
-#define ADC5_AMUX_THM2_400K_PU			0x6e
-#define ADC5_AMUX_THM3_400K_PU			0x6f
-#define ADC5_AMUX_THM4_400K_PU			0x70
-#define ADC5_AMUX_THM5_400K_PU			0x71
-#define ADC5_GPIO1_400K_PU			0x72
-#define ADC5_GPIO2_400K_PU			0x73
-#define ADC5_GPIO3_400K_PU			0x74
-#define ADC5_GPIO4_400K_PU			0x75
-#define ADC5_GPIO5_400K_PU			0x76
-#define ADC5_GPIO6_400K_PU			0x77
-#define ADC5_GPIO7_400K_PU			0x78
-#define ADC5_SBUx_400K_PU			0x79
-
-/* 1/3 Divider */
-#define ADC5_GPIO1_DIV3				0x92
-#define ADC5_GPIO2_DIV3				0x93
-#define ADC5_GPIO3_DIV3				0x94
-#define ADC5_GPIO4_DIV3				0x95
-#define ADC5_GPIO5_DIV3				0x96
-#define ADC5_GPIO6_DIV3				0x97
-#define ADC5_GPIO7_DIV3				0x98
-#define ADC5_SBUx_DIV3				0x99
-
-/* Current and combined current/voltage channels */
-#define ADC5_INT_EXT_ISENSE			0xa1
-#define ADC5_PARALLEL_ISENSE			0xa5
-#define ADC5_CUR_REPLICA_VDS			0xa7
-#define ADC5_CUR_SENS_BATFET_VDS_OFFSET		0xa9
-#define ADC5_CUR_SENS_REPLICA_VDS_OFFSET	0xab
-#define ADC5_EXT_SENS_OFFSET			0xad
-
-#define ADC5_INT_EXT_ISENSE_VBAT_VDATA		0xb0
-#define ADC5_INT_EXT_ISENSE_VBAT_IDATA		0xb1
-#define ADC5_EXT_ISENSE_VBAT_VDATA		0xb2
-#define ADC5_EXT_ISENSE_VBAT_IDATA		0xb3
-#define ADC5_PARALLEL_ISENSE_VBAT_VDATA		0xb4
-#define ADC5_PARALLEL_ISENSE_VBAT_IDATA		0xb5
-
-#define ADC5_MAX_CHANNEL			0xc0
-
-/* ADC channels for ADC for PMIC7 */
-
-#define ADC7_REF_GND				0x00
-#define ADC7_1P25VREF				0x01
-#define ADC7_VREF_VADC				0x02
-#define ADC7_DIE_TEMP				0x03
-
-#define ADC7_AMUX_THM1				0x04
-#define ADC7_AMUX_THM2				0x05
-#define ADC7_AMUX_THM3				0x06
-#define ADC7_AMUX_THM4				0x07
-#define ADC7_AMUX_THM5				0x08
-#define ADC7_AMUX_THM6				0x09
-#define ADC7_GPIO1				0x0a
-#define ADC7_GPIO2				0x0b
-#define ADC7_GPIO3				0x0c
-#define ADC7_GPIO4				0x0d
-
-#define ADC7_CHG_TEMP				0x10
-#define ADC7_USB_IN_V_16			0x11
-#define ADC7_VDC_16				0x12
-#define ADC7_CC1_ID				0x13
-#define ADC7_VREF_BAT_THERM			0x15
-#define ADC7_IIN_FB				0x17
-
-/* 30k pull-up1 */
-#define ADC7_AMUX_THM1_30K_PU			0x24
-#define ADC7_AMUX_THM2_30K_PU			0x25
-#define ADC7_AMUX_THM3_30K_PU			0x26
-#define ADC7_AMUX_THM4_30K_PU			0x27
-#define ADC7_AMUX_THM5_30K_PU			0x28
-#define ADC7_AMUX_THM6_30K_PU			0x29
-#define ADC7_GPIO1_30K_PU			0x2a
-#define ADC7_GPIO2_30K_PU			0x2b
-#define ADC7_GPIO3_30K_PU			0x2c
-#define ADC7_GPIO4_30K_PU			0x2d
-#define ADC7_CC1_ID_30K_PU			0x33
-
-/* 100k pull-up2 */
-#define ADC7_AMUX_THM1_100K_PU			0x44
-#define ADC7_AMUX_THM2_100K_PU			0x45
-#define ADC7_AMUX_THM3_100K_PU			0x46
-#define ADC7_AMUX_THM4_100K_PU			0x47
-#define ADC7_AMUX_THM5_100K_PU			0x48
-#define ADC7_AMUX_THM6_100K_PU			0x49
-#define ADC7_GPIO1_100K_PU			0x4a
-#define ADC7_GPIO2_100K_PU			0x4b
-#define ADC7_GPIO3_100K_PU			0x4c
-#define ADC7_GPIO4_100K_PU			0x4d
-#define ADC7_CC1_ID_100K_PU			0x53
-
-/* 400k pull-up3 */
-#define ADC7_AMUX_THM1_400K_PU			0x64
-#define ADC7_AMUX_THM2_400K_PU			0x65
-#define ADC7_AMUX_THM3_400K_PU			0x66
-#define ADC7_AMUX_THM4_400K_PU			0x67
-#define ADC7_AMUX_THM5_400K_PU			0x68
-#define ADC7_AMUX_THM6_400K_PU			0x69
-#define ADC7_GPIO1_400K_PU			0x6a
-#define ADC7_GPIO2_400K_PU			0x6b
-#define ADC7_GPIO3_400K_PU			0x6c
-#define ADC7_GPIO4_400K_PU			0x6d
-#define ADC7_CC1_ID_400K_PU			0x73
-
-/* 1/3 Divider */
-#define ADC7_GPIO1_DIV3				0x8a
-#define ADC7_GPIO2_DIV3				0x8b
-#define ADC7_GPIO3_DIV3				0x8c
-#define ADC7_GPIO4_DIV3				0x8d
-
-#define ADC7_VPH_PWR				0x8e
-#define ADC7_VBAT_SNS				0x8f
-
-#define ADC7_SBUx				0x94
-#define ADC7_VBAT_2S_MID			0x96
-
-#endif /* _DT_BINDINGS_QCOM_SPMI_VADC_H */
diff --git a/include/dt-bindings/interconnect/qcom,msm8916.h b/include/dt-bindings/interconnect/qcom,msm8916.h
deleted file mode 100644
index 359a75feb198..000000000000
--- a/include/dt-bindings/interconnect/qcom,msm8916.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Qualcomm interconnect IDs
- *
- * Copyright (c) 2019, Linaro Ltd.
- * Author: Georgi Djakov <georgi.djakov@linaro.org>
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8916_H
-#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8916_H
-
-#define BIMC_SNOC_SLV			0
-#define MASTER_JPEG			1
-#define MASTER_MDP_PORT0		2
-#define MASTER_QDSS_BAM			3
-#define MASTER_QDSS_ETR			4
-#define MASTER_SNOC_CFG			5
-#define MASTER_VFE			6
-#define MASTER_VIDEO_P0			7
-#define SNOC_MM_INT_0			8
-#define SNOC_MM_INT_1			9
-#define SNOC_MM_INT_2			10
-#define SNOC_MM_INT_BIMC		11
-#define PCNOC_SNOC_SLV			12
-#define SLAVE_APSS			13
-#define SLAVE_CATS_128			14
-#define SLAVE_OCMEM_64			15
-#define SLAVE_IMEM			16
-#define SLAVE_QDSS_STM			17
-#define SLAVE_SRVC_SNOC			18
-#define SNOC_BIMC_0_MAS			19
-#define SNOC_BIMC_1_MAS			20
-#define SNOC_INT_0			21
-#define SNOC_INT_1			22
-#define SNOC_INT_BIMC			23
-#define SNOC_PCNOC_MAS			24
-#define SNOC_QDSS_INT			25
-
-#define BIMC_SNOC_MAS			0
-#define MASTER_AMPSS_M0			1
-#define MASTER_GRAPHICS_3D		2
-#define MASTER_TCU0			3
-#define MASTER_TCU1			4
-#define SLAVE_AMPSS_L2			5
-#define SLAVE_EBI_CH0			6
-#define SNOC_BIMC_0_SLV			7
-#define SNOC_BIMC_1_SLV			8
-
-#define MASTER_BLSP_1			0
-#define MASTER_DEHR			1
-#define MASTER_LPASS			2
-#define MASTER_CRYPTO_CORE0		3
-#define MASTER_SDCC_1			4
-#define MASTER_SDCC_2			5
-#define MASTER_SPDM			6
-#define MASTER_USB_HS			7
-#define PCNOC_INT_0			8
-#define PCNOC_INT_1			9
-#define PCNOC_MAS_0			10
-#define PCNOC_MAS_1			11
-#define PCNOC_SLV_0			12
-#define PCNOC_SLV_1			13
-#define PCNOC_SLV_2			14
-#define PCNOC_SLV_3			15
-#define PCNOC_SLV_4			16
-#define PCNOC_SLV_8			17
-#define PCNOC_SLV_9			18
-#define PCNOC_SNOC_MAS			19
-#define SLAVE_BIMC_CFG			20
-#define SLAVE_BLSP_1			21
-#define SLAVE_BOOT_ROM			22
-#define SLAVE_CAMERA_CFG		23
-#define SLAVE_CLK_CTL			24
-#define SLAVE_CRYPTO_0_CFG		25
-#define SLAVE_DEHR_CFG			26
-#define SLAVE_DISPLAY_CFG		27
-#define SLAVE_GRAPHICS_3D_CFG		28
-#define SLAVE_IMEM_CFG			29
-#define SLAVE_LPASS			30
-#define SLAVE_MPM			31
-#define SLAVE_MSG_RAM			32
-#define SLAVE_MSS			33
-#define SLAVE_PDM			34
-#define SLAVE_PMIC_ARB			35
-#define SLAVE_PCNOC_CFG			36
-#define SLAVE_PRNG			37
-#define SLAVE_QDSS_CFG			38
-#define SLAVE_RBCPR_CFG			39
-#define SLAVE_SDCC_1			40
-#define SLAVE_SDCC_2			41
-#define SLAVE_SECURITY			42
-#define SLAVE_SNOC_CFG			43
-#define SLAVE_SPDM			44
-#define SLAVE_TCSR			45
-#define SLAVE_TLMM			46
-#define SLAVE_USB_HS			47
-#define SLAVE_VENUS_CFG			48
-#define SNOC_PCNOC_SLV			49
-
-#endif
diff --git a/include/dt-bindings/interconnect/qcom,msm8996-cbf.h b/include/dt-bindings/interconnect/qcom,msm8996-cbf.h
deleted file mode 100644
index aac5e69f6bd5..000000000000
--- a/include/dt-bindings/interconnect/qcom,msm8996-cbf.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-/*
- * Copyright (C) 2023 Linaro Ltd. All rights reserved.
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8996_CBF_H
-#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8996_CBF_H
-
-#define MASTER_CBF_M4M		0
-#define SLAVE_CBF_M4M		1
-
-#endif
diff --git a/include/dt-bindings/interconnect/qcom,msm8996.h b/include/dt-bindings/interconnect/qcom,msm8996.h
deleted file mode 100644
index a0b7c0ec7bed..000000000000
--- a/include/dt-bindings/interconnect/qcom,msm8996.h
+++ /dev/null
@@ -1,163 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
-/*
- * Qualcomm MSM8996 interconnect IDs
- *
- * Copyright (c) 2021 Yassine Oudjana <y.oudjana@protonmail.com>
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_MSM8996_H
-#define __DT_BINDINGS_INTERCONNECT_QCOM_MSM8996_H
-
-/* A0NOC */
-#define MASTER_PCIE_0			0
-#define MASTER_PCIE_1			1
-#define MASTER_PCIE_2			2
-
-/* A1NOC */
-#define MASTER_CNOC_A1NOC		0
-#define MASTER_CRYPTO_CORE0		1
-#define MASTER_PNOC_A1NOC		2
-
-/* A2NOC */
-#define MASTER_USB3			0
-#define MASTER_IPA			1
-#define MASTER_UFS			2
-
-/* BIMC */
-#define MASTER_AMPSS_M0			0
-#define MASTER_GRAPHICS_3D		1
-#define MASTER_MNOC_BIMC		2
-#define MASTER_SNOC_BIMC		3
-#define SLAVE_EBI_CH0			4
-#define SLAVE_HMSS_L3			5
-#define SLAVE_BIMC_SNOC_0		6
-#define SLAVE_BIMC_SNOC_1		7
-
-/* CNOC */
-#define MASTER_SNOC_CNOC		0
-#define MASTER_QDSS_DAP			1
-#define SLAVE_CNOC_A1NOC		2
-#define SLAVE_CLK_CTL			3
-#define SLAVE_TCSR			4
-#define SLAVE_TLMM			5
-#define SLAVE_CRYPTO_0_CFG		6
-#define SLAVE_MPM			7
-#define SLAVE_PIMEM_CFG			8
-#define SLAVE_IMEM_CFG			9
-#define SLAVE_MESSAGE_RAM		10
-#define SLAVE_BIMC_CFG			11
-#define SLAVE_PMIC_ARB			12
-#define SLAVE_PRNG			13
-#define SLAVE_DCC_CFG			14
-#define SLAVE_RBCPR_MX			15
-#define SLAVE_QDSS_CFG			16
-#define SLAVE_RBCPR_CX			17
-#define SLAVE_QDSS_RBCPR_APU		18
-#define SLAVE_CNOC_MNOC_CFG		19
-#define SLAVE_SNOC_CFG			20
-#define SLAVE_SNOC_MPU_CFG		21
-#define SLAVE_EBI1_PHY_CFG		22
-#define SLAVE_A0NOC_CFG			23
-#define SLAVE_PCIE_1_CFG		24
-#define SLAVE_PCIE_2_CFG		25
-#define SLAVE_PCIE_0_CFG		26
-#define SLAVE_PCIE20_AHB2PHY		27
-#define SLAVE_A0NOC_MPU_CFG		28
-#define SLAVE_UFS_CFG			29
-#define SLAVE_A1NOC_CFG			30
-#define SLAVE_A1NOC_MPU_CFG		31
-#define SLAVE_A2NOC_CFG			32
-#define SLAVE_A2NOC_MPU_CFG		33
-#define SLAVE_SSC_CFG			34
-#define SLAVE_A0NOC_SMMU_CFG		35
-#define SLAVE_A1NOC_SMMU_CFG		36
-#define SLAVE_A2NOC_SMMU_CFG		37
-#define SLAVE_LPASS_SMMU_CFG		38
-#define SLAVE_CNOC_MNOC_MMSS_CFG	39
-
-/* MNOC */
-#define MASTER_CNOC_MNOC_CFG		0
-#define MASTER_CPP			1
-#define MASTER_JPEG			2
-#define MASTER_MDP_PORT0		3
-#define MASTER_MDP_PORT1		4
-#define MASTER_ROTATOR			5
-#define MASTER_VIDEO_P0			6
-#define MASTER_VFE			7
-#define MASTER_SNOC_VMEM		8
-#define MASTER_VIDEO_P0_OCMEM		9
-#define MASTER_CNOC_MNOC_MMSS_CFG	10
-#define SLAVE_MNOC_BIMC			11
-#define SLAVE_VMEM			12
-#define SLAVE_SERVICE_MNOC		13
-#define SLAVE_MMAGIC_CFG		14
-#define SLAVE_CPR_CFG			15
-#define SLAVE_MISC_CFG			16
-#define SLAVE_VENUS_THROTTLE_CFG	17
-#define SLAVE_VENUS_CFG			18
-#define SLAVE_VMEM_CFG			19
-#define SLAVE_DSA_CFG			20
-#define SLAVE_MMSS_CLK_CFG		21
-#define SLAVE_DSA_MPU_CFG		22
-#define SLAVE_MNOC_MPU_CFG		23
-#define SLAVE_DISPLAY_CFG		24
-#define SLAVE_DISPLAY_THROTTLE_CFG	25
-#define SLAVE_CAMERA_CFG		26
-#define SLAVE_CAMERA_THROTTLE_CFG	27
-#define SLAVE_GRAPHICS_3D_CFG		28
-#define SLAVE_SMMU_MDP_CFG		29
-#define SLAVE_SMMU_ROT_CFG		30
-#define SLAVE_SMMU_VENUS_CFG		31
-#define SLAVE_SMMU_CPP_CFG		32
-#define SLAVE_SMMU_JPEG_CFG		33
-#define SLAVE_SMMU_VFE_CFG		34
-
-/* PNOC */
-#define MASTER_SNOC_PNOC		0
-#define MASTER_SDCC_1			1
-#define MASTER_SDCC_2			2
-#define MASTER_SDCC_4			3
-#define MASTER_USB_HS			4
-#define MASTER_BLSP_1			5
-#define MASTER_BLSP_2			6
-#define MASTER_TSIF			7
-#define SLAVE_PNOC_A1NOC		8
-#define SLAVE_USB_HS			9
-#define SLAVE_SDCC_2			10
-#define SLAVE_SDCC_4			11
-#define SLAVE_TSIF			12
-#define SLAVE_BLSP_2			13
-#define SLAVE_SDCC_1			14
-#define SLAVE_BLSP_1			15
-#define SLAVE_PDM			16
-#define SLAVE_AHB2PHY			17
-
-/* SNOC */
-#define MASTER_HMSS			0
-#define MASTER_QDSS_BAM			1
-#define MASTER_SNOC_CFG			2
-#define MASTER_BIMC_SNOC_0		3
-#define MASTER_BIMC_SNOC_1		4
-#define MASTER_A0NOC_SNOC		5
-#define MASTER_A1NOC_SNOC		6
-#define MASTER_A2NOC_SNOC		7
-#define MASTER_QDSS_ETR			8
-#define SLAVE_A0NOC_SNOC		9
-#define SLAVE_A1NOC_SNOC		10
-#define SLAVE_A2NOC_SNOC		11
-#define SLAVE_HMSS			12
-#define SLAVE_LPASS			13
-#define SLAVE_USB3			14
-#define SLAVE_SNOC_BIMC			15
-#define SLAVE_SNOC_CNOC			16
-#define SLAVE_IMEM			17
-#define SLAVE_PIMEM			18
-#define SLAVE_SNOC_VMEM			19
-#define SLAVE_SNOC_PNOC			20
-#define SLAVE_QDSS_STM			21
-#define SLAVE_PCIE_0			22
-#define SLAVE_PCIE_1			23
-#define SLAVE_PCIE_2			24
-#define SLAVE_SERVICE_SNOC		25
-
-#endif
diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
deleted file mode 100644
index 61ef649ae565..000000000000
--- a/include/dt-bindings/interconnect/qcom,osm-l3.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2019 The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
-#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
-
-#define MASTER_OSM_L3_APPS	0
-#define SLAVE_OSM_L3		1
-
-#define MASTER_EPSS_L3_APPS	0
-#define SLAVE_EPSS_L3_SHARED	1
-
-#endif
diff --git a/include/dt-bindings/interconnect/qcom,sdm845.h b/include/dt-bindings/interconnect/qcom,sdm845.h
deleted file mode 100644
index 67b500e24915..000000000000
--- a/include/dt-bindings/interconnect/qcom,sdm845.h
+++ /dev/null
@@ -1,150 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Qualcomm SDM845 interconnect IDs
- *
- * Copyright (c) 2018, Linaro Ltd.
- * Author: Georgi Djakov <georgi.djakov@linaro.org>
- */
-
-#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_SDM845_H
-#define __DT_BINDINGS_INTERCONNECT_QCOM_SDM845_H
-
-#define MASTER_A1NOC_CFG		0
-#define MASTER_TSIF			1
-#define MASTER_SDCC_2			2
-#define MASTER_SDCC_4			3
-#define MASTER_UFS_CARD			4
-#define MASTER_UFS_MEM			5
-#define MASTER_PCIE_0			6
-#define SLAVE_A1NOC_SNOC		7
-#define SLAVE_SERVICE_A1NOC		8
-#define SLAVE_ANOC_PCIE_A1NOC_SNOC	9
-#define MASTER_QUP_1			10
-
-#define MASTER_A2NOC_CFG		0
-#define MASTER_QDSS_BAM			1
-#define MASTER_CNOC_A2NOC		2
-#define MASTER_CRYPTO			3
-#define MASTER_IPA			4
-#define MASTER_PCIE_1			5
-#define MASTER_QDSS_ETR			6
-#define MASTER_USB3_0			7
-#define MASTER_USB3_1			8
-#define SLAVE_A2NOC_SNOC		9
-#define SLAVE_ANOC_PCIE_SNOC		10
-#define SLAVE_SERVICE_A2NOC		11
-#define MASTER_QUP_2			12
-
-#define MASTER_SPDM			0
-#define MASTER_TIC			1
-#define MASTER_SNOC_CNOC		2
-#define MASTER_QDSS_DAP			3
-#define SLAVE_A1NOC_CFG			4
-#define SLAVE_A2NOC_CFG			5
-#define SLAVE_AOP			6
-#define SLAVE_AOSS			7
-#define SLAVE_CAMERA_CFG		8
-#define SLAVE_CLK_CTL			9
-#define SLAVE_CDSP_CFG			10
-#define SLAVE_RBCPR_CX_CFG		11
-#define SLAVE_CRYPTO_0_CFG		12
-#define SLAVE_DCC_CFG			13
-#define SLAVE_CNOC_DDRSS		14
-#define SLAVE_DISPLAY_CFG		15
-#define SLAVE_GLM			16
-#define SLAVE_GFX3D_CFG			17
-#define SLAVE_IMEM_CFG			18
-#define SLAVE_IPA_CFG			19
-#define SLAVE_CNOC_MNOC_CFG		20
-#define SLAVE_PCIE_0_CFG		21
-#define SLAVE_PCIE_1_CFG		22
-#define SLAVE_PDM			23
-#define SLAVE_SOUTH_PHY_CFG		24
-#define SLAVE_PIMEM_CFG			25
-#define SLAVE_PRNG			26
-#define SLAVE_QDSS_CFG			27
-#define SLAVE_BLSP_2			28
-#define SLAVE_BLSP_1			29
-#define SLAVE_SDCC_2			30
-#define SLAVE_SDCC_4			31
-#define SLAVE_SNOC_CFG			32
-#define SLAVE_SPDM_WRAPPER		33
-#define SLAVE_SPSS_CFG			34
-#define SLAVE_TCSR			35
-#define SLAVE_TLMM_NORTH		36
-#define SLAVE_TLMM_SOUTH		37
-#define SLAVE_TSIF			38
-#define SLAVE_UFS_CARD_CFG		39
-#define SLAVE_UFS_MEM_CFG		40
-#define SLAVE_USB3_0			41
-#define SLAVE_USB3_1			42
-#define SLAVE_VENUS_CFG			43
-#define SLAVE_VSENSE_CTRL_CFG		44
-#define SLAVE_CNOC_A2NOC		45
-#define SLAVE_SERVICE_CNOC		46
-
-#define MASTER_CNOC_DC_NOC		0
-#define SLAVE_LLCC_CFG			1
-#define SLAVE_MEM_NOC_CFG		2
-
-#define MASTER_APPSS_PROC		0
-#define MASTER_GNOC_CFG			1
-#define SLAVE_GNOC_SNOC			2
-#define SLAVE_GNOC_MEM_NOC		3
-#define SLAVE_SERVICE_GNOC		4
-
-#define MASTER_TCU_0			0
-#define MASTER_MEM_NOC_CFG		1
-#define MASTER_GNOC_MEM_NOC		2
-#define MASTER_MNOC_HF_MEM_NOC		3
-#define MASTER_MNOC_SF_MEM_NOC		4
-#define MASTER_SNOC_GC_MEM_NOC		5
-#define MASTER_SNOC_SF_MEM_NOC		6
-#define MASTER_GFX3D			7
-#define SLAVE_MSS_PROC_MS_MPU_CFG	8
-#define SLAVE_MEM_NOC_GNOC		9
-#define SLAVE_LLCC			10
-#define SLAVE_MEM_NOC_SNOC		11
-#define SLAVE_SERVICE_MEM_NOC		12
-#define MASTER_LLCC			13
-#define SLAVE_EBI1			14
-
-#define MASTER_CNOC_MNOC_CFG		0
-#define MASTER_CAMNOC_HF0		1
-#define MASTER_CAMNOC_HF1		2
-#define MASTER_CAMNOC_SF		3
-#define MASTER_MDP0			4
-#define MASTER_MDP1			5
-#define MASTER_ROTATOR			6
-#define MASTER_VIDEO_P0			7
-#define MASTER_VIDEO_P1			8
-#define MASTER_VIDEO_PROC		9
-#define SLAVE_MNOC_SF_MEM_NOC		10
-#define SLAVE_MNOC_HF_MEM_NOC		11
-#define SLAVE_SERVICE_MNOC		12
-#define MASTER_CAMNOC_HF0_UNCOMP	13
-#define MASTER_CAMNOC_HF1_UNCOMP	14
-#define MASTER_CAMNOC_SF_UNCOMP		15
-#define SLAVE_CAMNOC_UNCOMP		16
-
-#define MASTER_SNOC_CFG			0
-#define MASTER_A1NOC_SNOC		1
-#define MASTER_A2NOC_SNOC		2
-#define MASTER_GNOC_SNOC		3
-#define MASTER_MEM_NOC_SNOC		4
-#define MASTER_ANOC_PCIE_SNOC		5
-#define MASTER_PIMEM			6
-#define MASTER_GIC			7
-#define SLAVE_APPSS			8
-#define SLAVE_SNOC_CNOC			9
-#define SLAVE_SNOC_MEM_NOC_GC		10
-#define SLAVE_SNOC_MEM_NOC_SF		11
-#define SLAVE_IMEM			12
-#define SLAVE_PCIE_0			13
-#define SLAVE_PCIE_1			14
-#define SLAVE_PIMEM			15
-#define SLAVE_SERVICE_SNOC		16
-#define SLAVE_QDSS_STM			17
-#define SLAVE_TCU			18
-
-#endif
diff --git a/include/dt-bindings/phy/phy-qcom-qmp.h b/include/dt-bindings/phy/phy-qcom-qmp.h
deleted file mode 100644
index 4edec4c5b224..000000000000
--- a/include/dt-bindings/phy/phy-qcom-qmp.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
-/*
- * Qualcomm QMP PHY constants
- *
- * Copyright (C) 2022 Linaro Limited
- */
-
-#ifndef _DT_BINDINGS_PHY_QMP
-#define _DT_BINDINGS_PHY_QMP
-
-/* QMP USB4-USB3-DP clocks */
-#define QMP_USB43DP_USB3_PIPE_CLK	0
-#define QMP_USB43DP_DP_LINK_CLK		1
-#define QMP_USB43DP_DP_VCO_DIV_CLK	2
-
-/* QMP USB4-USB3-DP PHYs */
-#define QMP_USB43DP_USB3_PHY		0
-#define QMP_USB43DP_DP_PHY		1
-
-#endif /* _DT_BINDINGS_PHY_QMP */
diff --git a/include/dt-bindings/phy/phy-qcom-qusb2.h b/include/dt-bindings/phy/phy-qcom-qusb2.h
deleted file mode 100644
index 5c5e4d800cac..000000000000
--- a/include/dt-bindings/phy/phy-qcom-qusb2.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_QCOM_PHY_QUSB2_H_
-#define _DT_BINDINGS_QCOM_PHY_QUSB2_H_
-
-/* PHY HSTX TRIM bit values (24mA to 15mA) */
-#define QUSB2_V2_HSTX_TRIM_24_0_MA		0x0
-#define QUSB2_V2_HSTX_TRIM_23_4_MA		0x1
-#define QUSB2_V2_HSTX_TRIM_22_8_MA		0x2
-#define QUSB2_V2_HSTX_TRIM_22_2_MA		0x3
-#define QUSB2_V2_HSTX_TRIM_21_6_MA		0x4
-#define QUSB2_V2_HSTX_TRIM_21_0_MA		0x5
-#define QUSB2_V2_HSTX_TRIM_20_4_MA		0x6
-#define QUSB2_V2_HSTX_TRIM_19_8_MA		0x7
-#define QUSB2_V2_HSTX_TRIM_19_2_MA		0x8
-#define QUSB2_V2_HSTX_TRIM_18_6_MA		0x9
-#define QUSB2_V2_HSTX_TRIM_18_0_MA		0xa
-#define QUSB2_V2_HSTX_TRIM_17_4_MA		0xb
-#define QUSB2_V2_HSTX_TRIM_16_8_MA		0xc
-#define QUSB2_V2_HSTX_TRIM_16_2_MA		0xd
-#define QUSB2_V2_HSTX_TRIM_15_6_MA		0xe
-#define QUSB2_V2_HSTX_TRIM_15_0_MA		0xf
-
-/* PHY PREEMPHASIS bit values */
-#define QUSB2_V2_PREEMPHASIS_NONE		0
-#define QUSB2_V2_PREEMPHASIS_5_PERCENT		1
-#define QUSB2_V2_PREEMPHASIS_10_PERCENT		2
-#define QUSB2_V2_PREEMPHASIS_15_PERCENT		3
-
-/* PHY PREEMPHASIS-WIDTH bit values */
-#define QUSB2_V2_PREEMPHASIS_WIDTH_FULL_BIT	0
-#define QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT	1
-
-#endif
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
deleted file mode 100644
index e5df5ce45a0f..000000000000
--- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
+++ /dev/null
@@ -1,164 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for the Qualcomm PMIC GPIO binding.
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_QCOM_PMIC_GPIO_H
-#define _DT_BINDINGS_PINCTRL_QCOM_PMIC_GPIO_H
-
-#define PMIC_GPIO_PULL_UP_30		0
-#define PMIC_GPIO_PULL_UP_1P5		1
-#define PMIC_GPIO_PULL_UP_31P5		2
-#define PMIC_GPIO_PULL_UP_1P5_30	3
-
-#define PMIC_GPIO_STRENGTH_NO		0
-#define PMIC_GPIO_STRENGTH_HIGH		1
-#define PMIC_GPIO_STRENGTH_MED		2
-#define PMIC_GPIO_STRENGTH_LOW		3
-
-/*
- * Note: PM8018 GPIO3 and GPIO4 are supporting
- * only S3 and L2 options (1.8V)
- */
-#define PM8018_GPIO_L6			0
-#define PM8018_GPIO_L5			1
-#define PM8018_GPIO_S3			2
-#define PM8018_GPIO_L14			3
-#define PM8018_GPIO_L2			4
-#define PM8018_GPIO_L4			5
-#define PM8018_GPIO_VDD			6
-
-/*
- * Note: PM8038 GPIO7 and GPIO8 are supporting
- * only L11 and L4 options (1.8V)
- */
-#define PM8038_GPIO_VPH			0
-#define PM8038_GPIO_BB			1
-#define PM8038_GPIO_L11			2
-#define PM8038_GPIO_L15			3
-#define PM8038_GPIO_L4			4
-#define PM8038_GPIO_L3			5
-#define PM8038_GPIO_L17			6
-
-#define PM8058_GPIO_VPH			0
-#define PM8058_GPIO_BB			1
-#define PM8058_GPIO_S3			2
-#define PM8058_GPIO_L3			3
-#define PM8058_GPIO_L7			4
-#define PM8058_GPIO_L6			5
-#define PM8058_GPIO_L5			6
-#define PM8058_GPIO_L2			7
-
-/*
- * Note: PM8916 GPIO1 and GPIO2 are supporting
- * only L2(1.15V) and L5(1.8V) options
- */
-#define PM8916_GPIO_VPH			0
-#define PM8916_GPIO_L2			2
-#define PM8916_GPIO_L5			3
-
-#define PM8917_GPIO_VPH			0
-#define PM8917_GPIO_S4			2
-#define PM8917_GPIO_L15			3
-#define PM8917_GPIO_L4			4
-#define PM8917_GPIO_L3			5
-#define PM8917_GPIO_L17			6
-
-#define PM8921_GPIO_VPH			0
-#define PM8921_GPIO_BB			1
-#define PM8921_GPIO_S4			2
-#define PM8921_GPIO_L15			3
-#define PM8921_GPIO_L4			4
-#define PM8921_GPIO_L3			5
-#define PM8921_GPIO_L17			6
-
-/*
- * Note: PM8941 gpios from 15 to 18 are supporting
- * only S3 and L6 options (1.8V)
- */
-#define PM8941_GPIO_VPH			0
-#define PM8941_GPIO_L1			1
-#define PM8941_GPIO_S3			2
-#define PM8941_GPIO_L6			3
-
-/*
- * Note: PMA8084 gpios from 15 to 18 are supporting
- * only S4 and L6 options (1.8V)
- */
-#define PMA8084_GPIO_VPH		0
-#define PMA8084_GPIO_L1			1
-#define PMA8084_GPIO_S4			2
-#define PMA8084_GPIO_L6			3
-
-#define PM8994_GPIO_VPH			0
-#define PM8994_GPIO_S4			2
-#define PM8994_GPIO_L12			3
-
-/* To be used with "function" */
-#define PMIC_GPIO_FUNC_NORMAL		"normal"
-#define PMIC_GPIO_FUNC_PAIRED		"paired"
-#define PMIC_GPIO_FUNC_FUNC1		"func1"
-#define PMIC_GPIO_FUNC_FUNC2		"func2"
-#define PMIC_GPIO_FUNC_FUNC3		"func3"
-#define PMIC_GPIO_FUNC_FUNC4		"func4"
-#define PMIC_GPIO_FUNC_DTEST1		"dtest1"
-#define PMIC_GPIO_FUNC_DTEST2		"dtest2"
-#define PMIC_GPIO_FUNC_DTEST3		"dtest3"
-#define PMIC_GPIO_FUNC_DTEST4		"dtest4"
-
-#define PM8038_GPIO1_2_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO3_5V_BOOST_EN	PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO4_SSBI_ALT_CLK	PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO5_6_EXT_REG_EN	PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO10_11_EXT_REG_EN	PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO6_7_CLK		PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO9_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
-#define PM8038_GPIO6_12_KYPD_DRV	PMIC_GPIO_FUNC_FUNC2
-
-#define PM8058_GPIO7_8_MP3_CLK		PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO7_8_BCLK_19P2MHZ	PMIC_GPIO_FUNC_FUNC2
-#define PM8058_GPIO9_26_KYPD_DRV	PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO21_23_UART_TX	PMIC_GPIO_FUNC_FUNC2
-#define PM8058_GPIO24_26_LPG_DRV	PMIC_GPIO_FUNC_FUNC2
-#define PM8058_GPIO33_BCLK_19P2MHZ	PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO34_35_MP3_CLK	PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO36_BCLK_19P2MHZ	PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO37_UPL_OUT		PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO37_UART_M_RX		PMIC_GPIO_FUNC_FUNC2
-#define PM8058_GPIO38_XO_SLEEP_CLK	PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO38_39_CLK_32KHZ	PMIC_GPIO_FUNC_FUNC2
-#define PM8058_GPIO39_MP3_CLK		PMIC_GPIO_FUNC_FUNC1
-#define PM8058_GPIO40_EXT_BB_EN		PMIC_GPIO_FUNC_FUNC1
-
-#define PM8916_GPIO1_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
-#define PM8916_GPIO1_KEYP_DRV		PMIC_GPIO_FUNC_FUNC2
-#define PM8916_GPIO2_DIV_CLK		PMIC_GPIO_FUNC_FUNC1
-#define PM8916_GPIO2_SLEEP_CLK		PMIC_GPIO_FUNC_FUNC2
-#define PM8916_GPIO3_KEYP_DRV		PMIC_GPIO_FUNC_FUNC1
-#define PM8916_GPIO4_KEYP_DRV		PMIC_GPIO_FUNC_FUNC2
-
-#define PM8917_GPIO9_18_KEYP_DRV	PMIC_GPIO_FUNC_FUNC1
-#define PM8917_GPIO20_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
-#define PM8917_GPIO21_23_UART_TX	PMIC_GPIO_FUNC_FUNC2
-#define PM8917_GPIO25_26_EXT_REG_EN	PMIC_GPIO_FUNC_FUNC1
-#define PM8917_GPIO37_38_XO_SLEEP_CLK	PMIC_GPIO_FUNC_FUNC1
-#define PM8917_GPIO37_38_MP3_CLK	PMIC_GPIO_FUNC_FUNC2
-
-#define PM8941_GPIO9_14_KYPD_DRV	PMIC_GPIO_FUNC_FUNC1
-#define PM8941_GPIO15_18_DIV_CLK	PMIC_GPIO_FUNC_FUNC1
-#define PM8941_GPIO15_18_SLEEP_CLK	PMIC_GPIO_FUNC_FUNC2
-#define PM8941_GPIO23_26_KYPD_DRV	PMIC_GPIO_FUNC_FUNC1
-#define PM8941_GPIO23_26_LPG_DRV_HI	PMIC_GPIO_FUNC_FUNC2
-#define PM8941_GPIO31_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
-#define PM8941_GPIO33_36_LPG_DRV_3D	PMIC_GPIO_FUNC_FUNC1
-#define PM8941_GPIO33_36_LPG_DRV_HI	PMIC_GPIO_FUNC_FUNC2
-
-#define PMA8084_GPIO4_5_LPG_DRV		PMIC_GPIO_FUNC_FUNC1
-#define PMA8084_GPIO7_10_LPG_DRV	PMIC_GPIO_FUNC_FUNC1
-#define PMA8084_GPIO5_14_KEYP_DRV	PMIC_GPIO_FUNC_FUNC2
-#define PMA8084_GPIO19_21_KEYP_DRV	PMIC_GPIO_FUNC_FUNC2
-#define PMA8084_GPIO15_18_DIV_CLK	PMIC_GPIO_FUNC_FUNC1
-#define PMA8084_GPIO15_18_SLEEP_CLK	PMIC_GPIO_FUNC_FUNC2
-#define PMA8084_GPIO22_BAT_ALRM_OUT	PMIC_GPIO_FUNC_FUNC1
-
-#endif
diff --git a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
deleted file mode 100644
index 32e66ee7e830..000000000000
--- a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
+++ /dev/null
@@ -1,106 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * This header provides constants for the Qualcomm PMIC's
- * Multi-Purpose Pin binding.
- */
-
-#ifndef _DT_BINDINGS_PINCTRL_QCOM_PMIC_MPP_H
-#define _DT_BINDINGS_PINCTRL_QCOM_PMIC_MPP_H
-
-/* power-source */
-
-/* Digital Input/Output: level [PM8058] */
-#define PM8058_MPP_VPH			0
-#define PM8058_MPP_S3			1
-#define PM8058_MPP_L2			2
-#define PM8058_MPP_L3			3
-
-/* Digital Input/Output: level [PM8901] */
-#define PM8901_MPP_MSMIO		0
-#define PM8901_MPP_DIG			1
-#define PM8901_MPP_L5			2
-#define PM8901_MPP_S4			3
-#define PM8901_MPP_VPH			4
-
-/* Digital Input/Output: level [PM8921] */
-#define PM8921_MPP_S4			1
-#define PM8921_MPP_L15			3
-#define PM8921_MPP_L17			4
-#define PM8921_MPP_VPH			7
-
-/* Digital Input/Output: level [PM8821] */
-#define PM8821_MPP_1P8			0
-#define PM8821_MPP_VPH			7
-
-/* Digital Input/Output: level [PM8018] */
-#define PM8018_MPP_L4			0
-#define PM8018_MPP_L14			1
-#define PM8018_MPP_S3			2
-#define PM8018_MPP_L6			3
-#define PM8018_MPP_L2			4
-#define PM8018_MPP_L5			5
-#define PM8018_MPP_VPH			7
-
-/* Digital Input/Output: level [PM8038] */
-#define PM8038_MPP_L20			0
-#define PM8038_MPP_L11			1
-#define PM8038_MPP_L5			2
-#define PM8038_MPP_L15			3
-#define PM8038_MPP_L17			4
-#define PM8038_MPP_VPH			7
-
-#define PM8841_MPP_VPH			0
-#define PM8841_MPP_S3			2
-
-#define PM8916_MPP_VPH			0
-#define PM8916_MPP_L2			2
-#define PM8916_MPP_L5			3
-
-#define PM8941_MPP_VPH			0
-#define PM8941_MPP_L1			1
-#define PM8941_MPP_S3			2
-#define PM8941_MPP_L6			3
-
-#define PMA8084_MPP_VPH			0
-#define PMA8084_MPP_L1			1
-#define PMA8084_MPP_S4			2
-#define PMA8084_MPP_L6			3
-
-#define PM8994_MPP_VPH			0
-/* Only supported for MPP_05-MPP_08 */
-#define PM8994_MPP_L19			1
-#define PM8994_MPP_S4			2
-#define PM8994_MPP_L12			3
-
-/*
- * Analog Input - Set the source for analog input.
- * To be used with "qcom,amux-route" property
- */
-#define PMIC_MPP_AMUX_ROUTE_CH5		0
-#define PMIC_MPP_AMUX_ROUTE_CH6		1
-#define PMIC_MPP_AMUX_ROUTE_CH7		2
-#define PMIC_MPP_AMUX_ROUTE_CH8		3
-#define PMIC_MPP_AMUX_ROUTE_ABUS1	4
-#define PMIC_MPP_AMUX_ROUTE_ABUS2	5
-#define PMIC_MPP_AMUX_ROUTE_ABUS3	6
-#define PMIC_MPP_AMUX_ROUTE_ABUS4	7
-
-/* Analog Output: level */
-#define PMIC_MPP_AOUT_LVL_1V25		0
-#define PMIC_MPP_AOUT_LVL_1V25_2	1
-#define PMIC_MPP_AOUT_LVL_0V625		2
-#define PMIC_MPP_AOUT_LVL_0V3125	3
-#define PMIC_MPP_AOUT_LVL_MPP		4
-#define PMIC_MPP_AOUT_LVL_ABUS1		5
-#define PMIC_MPP_AOUT_LVL_ABUS2		6
-#define PMIC_MPP_AOUT_LVL_ABUS3		7
-
-/* To be used with "function" */
-#define PMIC_MPP_FUNC_NORMAL		"normal"
-#define PMIC_MPP_FUNC_PAIRED		"paired"
-#define PMIC_MPP_FUNC_DTEST1		"dtest1"
-#define PMIC_MPP_FUNC_DTEST2		"dtest2"
-#define PMIC_MPP_FUNC_DTEST3		"dtest3"
-#define PMIC_MPP_FUNC_DTEST4		"dtest4"
-
-#endif
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
deleted file mode 100644
index 7f4e2983a4c5..000000000000
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ /dev/null
@@ -1,412 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
-
-#ifndef _DT_BINDINGS_POWER_QCOM_RPMPD_H
-#define _DT_BINDINGS_POWER_QCOM_RPMPD_H
-
-/* SA8775P Power Domain Indexes */
-#define SA8775P_CX	0
-#define SA8775P_CX_AO	1
-#define SA8775P_DDR	2
-#define SA8775P_EBI	3
-#define SA8775P_GFX	4
-#define SA8775P_LCX	5
-#define SA8775P_LMX	6
-#define SA8775P_MMCX	7
-#define SA8775P_MMCX_AO	8
-#define SA8775P_MSS	9
-#define SA8775P_MX	10
-#define SA8775P_MX_AO	11
-#define SA8775P_MXC	12
-#define SA8775P_MXC_AO	13
-#define SA8775P_NSP0	14
-#define SA8775P_NSP1	15
-#define SA8775P_XO	16
-
-/* SDM670 Power Domain Indexes */
-#define SDM670_MX	0
-#define SDM670_MX_AO	1
-#define SDM670_CX	2
-#define SDM670_CX_AO	3
-#define SDM670_LMX	4
-#define SDM670_LCX	5
-#define SDM670_GFX	6
-#define SDM670_MSS	7
-
-/* SDM845 Power Domain Indexes */
-#define SDM845_EBI	0
-#define SDM845_MX	1
-#define SDM845_MX_AO	2
-#define SDM845_CX	3
-#define SDM845_CX_AO	4
-#define SDM845_LMX	5
-#define SDM845_LCX	6
-#define SDM845_GFX	7
-#define SDM845_MSS	8
-
-/* SDX55 Power Domain Indexes */
-#define SDX55_MSS	0
-#define SDX55_MX	1
-#define SDX55_CX	2
-
-/* SDX65 Power Domain Indexes */
-#define SDX65_MSS	0
-#define SDX65_MX	1
-#define SDX65_MX_AO	2
-#define SDX65_CX	3
-#define SDX65_CX_AO	4
-#define SDX65_MXC	5
-
-/* SM6350 Power Domain Indexes */
-#define SM6350_CX	0
-#define SM6350_GFX	1
-#define SM6350_LCX	2
-#define SM6350_LMX	3
-#define SM6350_MSS	4
-#define SM6350_MX	5
-
-/* SM6350 Power Domain Indexes */
-#define SM6375_VDDCX		0
-#define SM6375_VDDCX_AO	1
-#define SM6375_VDDCX_VFL	2
-#define SM6375_VDDMX		3
-#define SM6375_VDDMX_AO	4
-#define SM6375_VDDMX_VFL	5
-#define SM6375_VDDGX		6
-#define SM6375_VDDGX_AO	7
-#define SM6375_VDD_LPI_CX	8
-#define SM6375_VDD_LPI_MX	9
-
-/* SM8150 Power Domain Indexes */
-#define SM8150_MSS	0
-#define SM8150_EBI	1
-#define SM8150_LMX	2
-#define SM8150_LCX	3
-#define SM8150_GFX	4
-#define SM8150_MX	5
-#define SM8150_MX_AO	6
-#define SM8150_CX	7
-#define SM8150_CX_AO	8
-#define SM8150_MMCX	9
-#define SM8150_MMCX_AO	10
-
-/* SA8155P is a special case, kept for backwards compatibility */
-#define SA8155P_CX	SM8150_CX
-#define SA8155P_CX_AO	SM8150_CX_AO
-#define SA8155P_EBI	SM8150_EBI
-#define SA8155P_GFX	SM8150_GFX
-#define SA8155P_MSS	SM8150_MSS
-#define SA8155P_MX	SM8150_MX
-#define SA8155P_MX_AO	SM8150_MX_AO
-
-/* SM8250 Power Domain Indexes */
-#define SM8250_CX	0
-#define SM8250_CX_AO	1
-#define SM8250_EBI	2
-#define SM8250_GFX	3
-#define SM8250_LCX	4
-#define SM8250_LMX	5
-#define SM8250_MMCX	6
-#define SM8250_MMCX_AO	7
-#define SM8250_MX	8
-#define SM8250_MX_AO	9
-
-/* SM8350 Power Domain Indexes */
-#define SM8350_CX	0
-#define SM8350_CX_AO	1
-#define SM8350_EBI	2
-#define SM8350_GFX	3
-#define SM8350_LCX	4
-#define SM8350_LMX	5
-#define SM8350_MMCX	6
-#define SM8350_MMCX_AO	7
-#define SM8350_MX	8
-#define SM8350_MX_AO	9
-#define SM8350_MXC	10
-#define SM8350_MXC_AO	11
-#define SM8350_MSS	12
-
-/* SM8450 Power Domain Indexes */
-#define SM8450_CX	0
-#define SM8450_CX_AO	1
-#define SM8450_EBI	2
-#define SM8450_GFX	3
-#define SM8450_LCX	4
-#define SM8450_LMX	5
-#define SM8450_MMCX	6
-#define SM8450_MMCX_AO	7
-#define SM8450_MX	8
-#define SM8450_MX_AO	9
-#define SM8450_MXC	10
-#define SM8450_MXC_AO	11
-#define SM8450_MSS	12
-
-/* SM8550 Power Domain Indexes */
-#define SM8550_CX	0
-#define SM8550_CX_AO	1
-#define SM8550_EBI	2
-#define SM8550_GFX	3
-#define SM8550_LCX	4
-#define SM8550_LMX	5
-#define SM8550_MMCX	6
-#define SM8550_MMCX_AO	7
-#define SM8550_MX	8
-#define SM8550_MX_AO	9
-#define SM8550_MXC	10
-#define SM8550_MXC_AO	11
-#define SM8550_MSS	12
-#define SM8550_NSP	13
-
-/* QDU1000/QRU1000 Power Domain Indexes */
-#define QDU1000_EBI	0
-#define QDU1000_MSS	1
-#define QDU1000_CX	2
-#define QDU1000_MX	3
-
-/* SC7180 Power Domain Indexes */
-#define SC7180_CX	0
-#define SC7180_CX_AO	1
-#define SC7180_GFX	2
-#define SC7180_MX	3
-#define SC7180_MX_AO	4
-#define SC7180_LMX	5
-#define SC7180_LCX	6
-#define SC7180_MSS	7
-
-/* SC7280 Power Domain Indexes */
-#define SC7280_CX	0
-#define SC7280_CX_AO	1
-#define SC7280_EBI	2
-#define SC7280_GFX	3
-#define SC7280_MX	4
-#define SC7280_MX_AO	5
-#define SC7280_LMX	6
-#define SC7280_LCX	7
-#define SC7280_MSS	8
-
-/* SC8180X Power Domain Indexes */
-#define SC8180X_CX	0
-#define SC8180X_CX_AO	1
-#define SC8180X_EBI	2
-#define SC8180X_GFX	3
-#define SC8180X_LCX	4
-#define SC8180X_LMX	5
-#define SC8180X_MMCX	6
-#define SC8180X_MMCX_AO	7
-#define SC8180X_MSS	8
-#define SC8180X_MX	9
-#define SC8180X_MX_AO	10
-
-/* SC8280XP Power Domain Indexes */
-#define SC8280XP_CX		0
-#define SC8280XP_CX_AO		1
-#define SC8280XP_DDR		2
-#define SC8280XP_EBI		3
-#define SC8280XP_GFX		4
-#define SC8280XP_LCX		5
-#define SC8280XP_LMX		6
-#define SC8280XP_MMCX		7
-#define SC8280XP_MMCX_AO	8
-#define SC8280XP_MSS		9
-#define SC8280XP_MX		10
-#define SC8280XP_MXC		12
-#define SC8280XP_MX_AO		11
-#define SC8280XP_NSP		13
-#define SC8280XP_QPHY		14
-#define SC8280XP_XO		15
-
-/* SDM845 Power Domain performance levels */
-#define RPMH_REGULATOR_LEVEL_RETENTION		16
-#define RPMH_REGULATOR_LEVEL_MIN_SVS		48
-#define RPMH_REGULATOR_LEVEL_LOW_SVS_D2		52
-#define RPMH_REGULATOR_LEVEL_LOW_SVS_D1		56
-#define RPMH_REGULATOR_LEVEL_LOW_SVS_D0		60
-#define RPMH_REGULATOR_LEVEL_LOW_SVS		64
-#define RPMH_REGULATOR_LEVEL_LOW_SVS_P1		72
-#define RPMH_REGULATOR_LEVEL_LOW_SVS_L1		80
-#define RPMH_REGULATOR_LEVEL_LOW_SVS_L2		96
-#define RPMH_REGULATOR_LEVEL_SVS		128
-#define RPMH_REGULATOR_LEVEL_SVS_L0		144
-#define RPMH_REGULATOR_LEVEL_SVS_L1		192
-#define RPMH_REGULATOR_LEVEL_SVS_L2		224
-#define RPMH_REGULATOR_LEVEL_NOM		256
-#define RPMH_REGULATOR_LEVEL_NOM_L0		288
-#define RPMH_REGULATOR_LEVEL_NOM_L1		320
-#define RPMH_REGULATOR_LEVEL_NOM_L2		336
-#define RPMH_REGULATOR_LEVEL_TURBO		384
-#define RPMH_REGULATOR_LEVEL_TURBO_L0		400
-#define RPMH_REGULATOR_LEVEL_TURBO_L1		416
-#define RPMH_REGULATOR_LEVEL_TURBO_L2		432
-#define RPMH_REGULATOR_LEVEL_TURBO_L3		448
-#define RPMH_REGULATOR_LEVEL_SUPER_TURBO 	464
-#define RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR	480
-
-/* MDM9607 Power Domains */
-#define MDM9607_VDDCX		0
-#define MDM9607_VDDCX_AO	1
-#define MDM9607_VDDCX_VFL	2
-#define MDM9607_VDDMX		3
-#define MDM9607_VDDMX_AO	4
-#define MDM9607_VDDMX_VFL	5
-
-/* MSM8226 Power Domain Indexes */
-#define MSM8226_VDDCX		0
-#define MSM8226_VDDCX_AO	1
-#define MSM8226_VDDCX_VFC	2
-
-/* MSM8939 Power Domains */
-#define MSM8939_VDDMDCX		0
-#define MSM8939_VDDMDCX_AO	1
-#define MSM8939_VDDMDCX_VFC	2
-#define MSM8939_VDDCX		3
-#define MSM8939_VDDCX_AO	4
-#define MSM8939_VDDCX_VFC	5
-#define MSM8939_VDDMX		6
-#define MSM8939_VDDMX_AO	7
-
-/* MSM8916 Power Domain Indexes */
-#define MSM8916_VDDCX		0
-#define MSM8916_VDDCX_AO	1
-#define MSM8916_VDDCX_VFC	2
-#define MSM8916_VDDMX		3
-#define MSM8916_VDDMX_AO	4
-
-/* MSM8909 Power Domain Indexes */
-#define MSM8909_VDDCX		MSM8916_VDDCX
-#define MSM8909_VDDCX_AO	MSM8916_VDDCX_AO
-#define MSM8909_VDDCX_VFC	MSM8916_VDDCX_VFC
-#define MSM8909_VDDMX		MSM8916_VDDMX
-#define MSM8909_VDDMX_AO	MSM8916_VDDMX_AO
-
-/* MSM8917 Power Domain Indexes */
-#define MSM8917_VDDCX		0
-#define MSM8917_VDDCX_AO	1
-#define MSM8917_VDDCX_VFL	2
-#define MSM8917_VDDMX		3
-#define MSM8917_VDDMX_AO	4
-
-/* MSM8937 Power Domain Indexes */
-#define MSM8937_VDDCX		MSM8917_VDDCX
-#define MSM8937_VDDCX_AO	MSM8917_VDDCX_AO
-#define MSM8937_VDDCX_VFL	MSM8917_VDDCX_VFL
-#define MSM8937_VDDMX		MSM8917_VDDMX
-#define MSM8937_VDDMX_AO	MSM8917_VDDMX_AO
-
-/* QM215 Power Domain Indexes */
-#define QM215_VDDCX		MSM8917_VDDCX
-#define QM215_VDDCX_AO		MSM8917_VDDCX_AO
-#define QM215_VDDCX_VFL		MSM8917_VDDCX_VFL
-#define QM215_VDDMX		MSM8917_VDDMX
-#define QM215_VDDMX_AO		MSM8917_VDDMX_AO
-
-/* MSM8953 Power Domain Indexes */
-#define MSM8953_VDDMD		0
-#define MSM8953_VDDMD_AO	1
-#define MSM8953_VDDCX		2
-#define MSM8953_VDDCX_AO	3
-#define MSM8953_VDDCX_VFL	4
-#define MSM8953_VDDMX		5
-#define MSM8953_VDDMX_AO	6
-
-/* MSM8976 Power Domain Indexes */
-#define MSM8976_VDDCX		0
-#define MSM8976_VDDCX_AO	1
-#define MSM8976_VDDCX_VFL	2
-#define MSM8976_VDDMX		3
-#define MSM8976_VDDMX_AO	4
-#define MSM8976_VDDMX_VFL	5
-
-/* MSM8994 Power Domain Indexes */
-#define MSM8994_VDDCX		0
-#define MSM8994_VDDCX_AO	1
-#define MSM8994_VDDCX_VFC	2
-#define MSM8994_VDDMX		3
-#define MSM8994_VDDMX_AO	4
-#define MSM8994_VDDGFX		5
-#define MSM8994_VDDGFX_VFC	6
-
-/* MSM8996 Power Domain Indexes */
-#define MSM8996_VDDCX		0
-#define MSM8996_VDDCX_AO	1
-#define MSM8996_VDDCX_VFC	2
-#define MSM8996_VDDMX		3
-#define MSM8996_VDDMX_AO	4
-#define MSM8996_VDDSSCX		5
-#define MSM8996_VDDSSCX_VFC	6
-
-/* MSM8998 Power Domain Indexes */
-#define MSM8998_VDDCX		0
-#define MSM8998_VDDCX_AO	1
-#define MSM8998_VDDCX_VFL	2
-#define MSM8998_VDDMX		3
-#define MSM8998_VDDMX_AO	4
-#define MSM8998_VDDMX_VFL	5
-#define MSM8998_SSCCX		6
-#define MSM8998_SSCCX_VFL	7
-#define MSM8998_SSCMX		8
-#define MSM8998_SSCMX_VFL	9
-
-/* QCS404 Power Domains */
-#define QCS404_VDDMX		0
-#define QCS404_VDDMX_AO		1
-#define QCS404_VDDMX_VFL	2
-#define QCS404_LPICX		3
-#define QCS404_LPICX_VFL	4
-#define QCS404_LPIMX		5
-#define QCS404_LPIMX_VFL	6
-
-/* SDM660 Power Domains */
-#define SDM660_VDDCX		0
-#define SDM660_VDDCX_AO		1
-#define SDM660_VDDCX_VFL	2
-#define SDM660_VDDMX		3
-#define SDM660_VDDMX_AO		4
-#define SDM660_VDDMX_VFL	5
-#define SDM660_SSCCX		6
-#define SDM660_SSCCX_VFL	7
-#define SDM660_SSCMX		8
-#define SDM660_SSCMX_VFL	9
-
-/* SM6115 Power Domains */
-#define SM6115_VDDCX		0
-#define SM6115_VDDCX_AO		1
-#define SM6115_VDDCX_VFL	2
-#define SM6115_VDDMX		3
-#define SM6115_VDDMX_AO		4
-#define SM6115_VDDMX_VFL	5
-#define SM6115_VDD_LPI_CX	6
-#define SM6115_VDD_LPI_MX	7
-
-/* SM6125 Power Domains */
-#define SM6125_VDDCX		0
-#define SM6125_VDDCX_AO		1
-#define SM6125_VDDCX_VFL	2
-#define SM6125_VDDMX		3
-#define SM6125_VDDMX_AO		4
-#define SM6125_VDDMX_VFL	5
-
-/* QCM2290 Power Domains */
-#define QCM2290_VDDCX		0
-#define QCM2290_VDDCX_AO	1
-#define QCM2290_VDDCX_VFL	2
-#define QCM2290_VDDMX		3
-#define QCM2290_VDDMX_AO	4
-#define QCM2290_VDDMX_VFL	5
-#define QCM2290_VDD_LPI_CX	6
-#define QCM2290_VDD_LPI_MX	7
-
-/* RPM SMD Power Domain performance levels */
-#define RPM_SMD_LEVEL_RETENTION       16
-#define RPM_SMD_LEVEL_RETENTION_PLUS  32
-#define RPM_SMD_LEVEL_MIN_SVS         48
-#define RPM_SMD_LEVEL_LOW_SVS         64
-#define RPM_SMD_LEVEL_SVS             128
-#define RPM_SMD_LEVEL_SVS_PLUS        192
-#define RPM_SMD_LEVEL_NOM             256
-#define RPM_SMD_LEVEL_NOM_PLUS        320
-#define RPM_SMD_LEVEL_TURBO           384
-#define RPM_SMD_LEVEL_TURBO_NO_CPR    416
-#define RPM_SMD_LEVEL_TURBO_HIGH      448
-#define RPM_SMD_LEVEL_BINNING         512
-
-#endif
diff --git a/include/dt-bindings/regulator/qcom,rpmh-regulator.h b/include/dt-bindings/regulator/qcom,rpmh-regulator.h
deleted file mode 100644
index 86713dcf9e02..000000000000
--- a/include/dt-bindings/regulator/qcom,rpmh-regulator.h
+++ /dev/null
@@ -1,36 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
-
-#ifndef __QCOM_RPMH_REGULATOR_H
-#define __QCOM_RPMH_REGULATOR_H
-
-/*
- * These mode constants may be used to specify modes for various RPMh regulator
- * device tree properties (e.g. regulator-initial-mode).  Each type of regulator
- * supports a subset of the possible modes.
- *
- * %RPMH_REGULATOR_MODE_RET:	Retention mode in which only an extremely small
- *				load current is allowed.  This mode is supported
- *				by LDO and SMPS type regulators.
- * %RPMH_REGULATOR_MODE_LPM:	Low power mode in which a small load current is
- *				allowed.  This mode corresponds to PFM for SMPS
- *				and BOB type regulators.  This mode is supported
- *				by LDO, HFSMPS, BOB, and PMIC4 FTSMPS type
- *				regulators.
- * %RPMH_REGULATOR_MODE_AUTO:	Auto mode in which the regulator hardware
- *				automatically switches between LPM and HPM based
- *				upon the real-time load current.  This mode is
- *				supported by HFSMPS, BOB, and PMIC4 FTSMPS type
- *				regulators.
- * %RPMH_REGULATOR_MODE_HPM:	High power mode in which the full rated current
- *				of the regulator is allowed.  This mode
- *				corresponds to PWM for SMPS and BOB type
- *				regulators.  This mode is supported by all types
- *				of regulators.
- */
-#define RPMH_REGULATOR_MODE_RET		0
-#define RPMH_REGULATOR_MODE_LPM		1
-#define RPMH_REGULATOR_MODE_AUTO	2
-#define RPMH_REGULATOR_MODE_HPM		3
-
-#endif
diff --git a/include/dt-bindings/reset/qcom,gcc-msm8916.h b/include/dt-bindings/reset/qcom,gcc-msm8916.h
deleted file mode 100644
index 1f9be10872df..000000000000
--- a/include/dt-bindings/reset/qcom,gcc-msm8916.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright 2015 Linaro Limited
- */
-
-#ifndef _DT_BINDINGS_RESET_MSM_GCC_8916_H
-#define _DT_BINDINGS_RESET_MSM_GCC_8916_H
-
-#define GCC_BLSP1_BCR			0
-#define GCC_BLSP1_QUP1_BCR		1
-#define GCC_BLSP1_UART1_BCR		2
-#define GCC_BLSP1_QUP2_BCR		3
-#define GCC_BLSP1_UART2_BCR		4
-#define GCC_BLSP1_QUP3_BCR		5
-#define GCC_BLSP1_QUP4_BCR		6
-#define GCC_BLSP1_QUP5_BCR		7
-#define GCC_BLSP1_QUP6_BCR		8
-#define GCC_IMEM_BCR			9
-#define GCC_SMMU_BCR			10
-#define GCC_APSS_TCU_BCR		11
-#define GCC_SMMU_XPU_BCR		12
-#define GCC_PCNOC_TBU_BCR		13
-#define GCC_PRNG_BCR			14
-#define GCC_BOOT_ROM_BCR		15
-#define GCC_CRYPTO_BCR			16
-#define GCC_SEC_CTRL_BCR		17
-#define GCC_AUDIO_CORE_BCR		18
-#define GCC_ULT_AUDIO_BCR		19
-#define GCC_DEHR_BCR			20
-#define GCC_SYSTEM_NOC_BCR		21
-#define GCC_PCNOC_BCR			22
-#define GCC_TCSR_BCR			23
-#define GCC_QDSS_BCR			24
-#define GCC_DCD_BCR			25
-#define GCC_MSG_RAM_BCR			26
-#define GCC_MPM_BCR			27
-#define GCC_SPMI_BCR			28
-#define GCC_SPDM_BCR			29
-#define GCC_MM_SPDM_BCR			30
-#define GCC_BIMC_BCR			31
-#define GCC_RBCPR_BCR			32
-#define GCC_TLMM_BCR			33
-#define GCC_USB_HS_BCR			34
-#define GCC_USB2A_PHY_BCR		35
-#define GCC_SDCC1_BCR			36
-#define GCC_SDCC2_BCR			37
-#define GCC_PDM_BCR			38
-#define GCC_SNOC_BUS_TIMEOUT0_BCR	39
-#define GCC_PCNOC_BUS_TIMEOUT0_BCR	40
-#define GCC_PCNOC_BUS_TIMEOUT1_BCR	41
-#define GCC_PCNOC_BUS_TIMEOUT2_BCR	42
-#define GCC_PCNOC_BUS_TIMEOUT3_BCR	43
-#define GCC_PCNOC_BUS_TIMEOUT4_BCR	44
-#define GCC_PCNOC_BUS_TIMEOUT5_BCR	45
-#define GCC_PCNOC_BUS_TIMEOUT6_BCR	46
-#define GCC_PCNOC_BUS_TIMEOUT7_BCR	47
-#define GCC_PCNOC_BUS_TIMEOUT8_BCR	48
-#define GCC_PCNOC_BUS_TIMEOUT9_BCR	49
-#define GCC_MMSS_BCR			50
-#define GCC_VENUS0_BCR			51
-#define GCC_MDSS_BCR			52
-#define GCC_CAMSS_PHY0_BCR		53
-#define GCC_CAMSS_CSI0_BCR		54
-#define GCC_CAMSS_CSI0PHY_BCR		55
-#define GCC_CAMSS_CSI0RDI_BCR		56
-#define GCC_CAMSS_CSI0PIX_BCR		57
-#define GCC_CAMSS_PHY1_BCR		58
-#define GCC_CAMSS_CSI1_BCR		59
-#define GCC_CAMSS_CSI1PHY_BCR		60
-#define GCC_CAMSS_CSI1RDI_BCR		61
-#define GCC_CAMSS_CSI1PIX_BCR		62
-#define GCC_CAMSS_ISPIF_BCR		63
-#define GCC_CAMSS_CCI_BCR		64
-#define GCC_CAMSS_MCLK0_BCR		65
-#define GCC_CAMSS_MCLK1_BCR		66
-#define GCC_CAMSS_GP0_BCR		67
-#define GCC_CAMSS_GP1_BCR		68
-#define GCC_CAMSS_TOP_BCR		69
-#define GCC_CAMSS_MICRO_BCR		70
-#define GCC_CAMSS_JPEG_BCR		71
-#define GCC_CAMSS_VFE_BCR		72
-#define GCC_CAMSS_CSI_VFE0_BCR		73
-#define GCC_OXILI_BCR			74
-#define GCC_GMEM_BCR			75
-#define GCC_CAMSS_AHB_BCR		76
-#define GCC_MDP_TBU_BCR			77
-#define GCC_GFX_TBU_BCR			78
-#define GCC_GFX_TCU_BCR			79
-#define GCC_MSS_TBU_AXI_BCR		80
-#define GCC_MSS_TBU_GSS_AXI_BCR		81
-#define GCC_MSS_TBU_Q6_AXI_BCR		82
-#define GCC_GTCU_AHB_BCR		83
-#define GCC_SMMU_CFG_BCR		84
-#define GCC_VFE_TBU_BCR			85
-#define GCC_VENUS_TBU_BCR		86
-#define GCC_JPEG_TBU_BCR		87
-#define GCC_PRONTO_TBU_BCR		88
-#define GCC_SMMU_CATS_BCR		89
-
-#endif
diff --git a/include/dt-bindings/reset/qcom,sdm845-aoss.h b/include/dt-bindings/reset/qcom,sdm845-aoss.h
deleted file mode 100644
index 476c5fc873b6..000000000000
--- a/include/dt-bindings/reset/qcom,sdm845-aoss.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_RESET_AOSS_SDM_845_H
-#define _DT_BINDINGS_RESET_AOSS_SDM_845_H
-
-#define AOSS_CC_MSS_RESTART	0
-#define AOSS_CC_CAMSS_RESTART	1
-#define AOSS_CC_VENUS_RESTART	2
-#define AOSS_CC_GPU_RESTART	3
-#define AOSS_CC_DISPSS_RESTART	4
-#define AOSS_CC_WCSS_RESTART	5
-#define AOSS_CC_LPASS_RESTART	6
-
-#endif
diff --git a/include/dt-bindings/reset/qcom,sdm845-pdc.h b/include/dt-bindings/reset/qcom,sdm845-pdc.h
deleted file mode 100644
index 03a0c0eb8147..000000000000
--- a/include/dt-bindings/reset/qcom,sdm845-pdc.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2018 The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DT_BINDINGS_RESET_PDC_SDM_845_H
-#define _DT_BINDINGS_RESET_PDC_SDM_845_H
-
-#define PDC_APPS_SYNC_RESET	0
-#define PDC_SP_SYNC_RESET	1
-#define PDC_AUDIO_SYNC_RESET	2
-#define PDC_SENSORS_SYNC_RESET	3
-#define PDC_AOP_SYNC_RESET	4
-#define PDC_DEBUG_SYNC_RESET	5
-#define PDC_GPU_SYNC_RESET	6
-#define PDC_DISPLAY_SYNC_RESET	7
-#define PDC_COMPUTE_SYNC_RESET	8
-#define PDC_MODEM_SYNC_RESET	9
-#define PDC_WLAN_RF_SYNC_RESET	10
-#define PDC_WPSS_SYNC_RESET	11
-
-#endif
diff --git a/include/dt-bindings/soc/qcom,apr.h b/include/dt-bindings/soc/qcom,apr.h
deleted file mode 100644
index 006362400c0f..000000000000
--- a/include/dt-bindings/soc/qcom,apr.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_QCOM_APR_H
-#define __DT_BINDINGS_QCOM_APR_H
-
-/* Domain IDs */
-#define APR_DOMAIN_SIM		0x1
-#define APR_DOMAIN_PC		0x2
-#define APR_DOMAIN_MODEM	0x3
-#define APR_DOMAIN_ADSP		0x4
-#define APR_DOMAIN_APPS		0x5
-#define APR_DOMAIN_MAX		0x6
-
-/* ADSP service IDs */
-#define APR_SVC_ADSP_CORE	0x3
-#define APR_SVC_AFE		0x4
-#define APR_SVC_VSM		0x5
-#define APR_SVC_VPM		0x6
-#define APR_SVC_ASM		0x7
-#define APR_SVC_ADM		0x8
-#define APR_SVC_ADSP_MVM	0x09
-#define APR_SVC_ADSP_CVS	0x0A
-#define APR_SVC_ADSP_CVP	0x0B
-#define APR_SVC_USM		0x0C
-#define APR_SVC_LSM		0x0D
-#define APR_SVC_VIDC		0x16
-#define APR_SVC_MAX		0x17
-
-#endif /* __DT_BINDINGS_QCOM_APR_H */
diff --git a/include/dt-bindings/soc/qcom,rpmh-rsc.h b/include/dt-bindings/soc/qcom,rpmh-rsc.h
deleted file mode 100644
index 868f998ea998..000000000000
--- a/include/dt-bindings/soc/qcom,rpmh-rsc.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
- */
-
-#ifndef __DT_QCOM_RPMH_RSC_H__
-#define __DT_QCOM_RPMH_RSC_H__
-
-#define SLEEP_TCS	0
-#define WAKE_TCS	1
-#define ACTIVE_TCS	2
-#define CONTROL_TCS	3
-
-#endif /* __DT_QCOM_RPMH_RSC_H__ */
diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
deleted file mode 100644
index a9404c3b8884..000000000000
--- a/include/dt-bindings/sound/qcom,lpass.h
+++ /dev/null
@@ -1,46 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_QCOM_LPASS_H
-#define __DT_QCOM_LPASS_H
-
-#define MI2S_PRIMARY	0
-#define MI2S_SECONDARY	1
-#define MI2S_TERTIARY	2
-#define MI2S_QUATERNARY	3
-#define MI2S_QUINARY	4
-
-#define LPASS_DP_RX	5
-
-#define LPASS_CDC_DMA_RX0 6
-#define LPASS_CDC_DMA_RX1 7
-#define LPASS_CDC_DMA_RX2 8
-#define LPASS_CDC_DMA_RX3 9
-#define LPASS_CDC_DMA_RX4 10
-#define LPASS_CDC_DMA_RX5 11
-#define LPASS_CDC_DMA_RX6 12
-#define LPASS_CDC_DMA_RX7 13
-#define LPASS_CDC_DMA_RX8 14
-#define LPASS_CDC_DMA_RX9 15
-
-#define LPASS_CDC_DMA_TX0 16
-#define LPASS_CDC_DMA_TX1 17
-#define LPASS_CDC_DMA_TX2 18
-#define LPASS_CDC_DMA_TX3 19
-#define LPASS_CDC_DMA_TX4 20
-#define LPASS_CDC_DMA_TX5 21
-#define LPASS_CDC_DMA_TX6 22
-#define LPASS_CDC_DMA_TX7 23
-#define LPASS_CDC_DMA_TX8 24
-
-#define LPASS_CDC_DMA_VA_TX0 25
-#define LPASS_CDC_DMA_VA_TX1 26
-#define LPASS_CDC_DMA_VA_TX2 27
-#define LPASS_CDC_DMA_VA_TX3 28
-#define LPASS_CDC_DMA_VA_TX4 29
-#define LPASS_CDC_DMA_VA_TX5 30
-#define LPASS_CDC_DMA_VA_TX6 31
-#define LPASS_CDC_DMA_VA_TX7 32
-#define LPASS_CDC_DMA_VA_TX8 33
-
-#define LPASS_MCLK0	0
-
-#endif /* __DT_QCOM_LPASS_H */
diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
deleted file mode 100644
index 9d5d89cfabcf..000000000000
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_Q6_AFE_H__
-#define __DT_BINDINGS_Q6_AFE_H__
-
-/* This file exists due to backward compatibility reasons, Please do not DELETE! */
-
-#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
-
-#endif /* __DT_BINDINGS_Q6_AFE_H__ */
diff --git a/include/dt-bindings/sound/qcom,q6asm.h b/include/dt-bindings/sound/qcom,q6asm.h
deleted file mode 100644
index f59d74f14395..000000000000
--- a/include/dt-bindings/sound/qcom,q6asm.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_Q6_ASM_H__
-#define __DT_BINDINGS_Q6_ASM_H__
-
-#define	MSM_FRONTEND_DAI_MULTIMEDIA1	0
-#define	MSM_FRONTEND_DAI_MULTIMEDIA2	1
-#define	MSM_FRONTEND_DAI_MULTIMEDIA3	2
-#define	MSM_FRONTEND_DAI_MULTIMEDIA4	3
-#define	MSM_FRONTEND_DAI_MULTIMEDIA5	4
-#define	MSM_FRONTEND_DAI_MULTIMEDIA6	5
-#define	MSM_FRONTEND_DAI_MULTIMEDIA7	6
-#define	MSM_FRONTEND_DAI_MULTIMEDIA8	7
-#define	MSM_FRONTEND_DAI_MULTIMEDIA9	8
-#define	MSM_FRONTEND_DAI_MULTIMEDIA10	9
-#define	MSM_FRONTEND_DAI_MULTIMEDIA11	10
-#define	MSM_FRONTEND_DAI_MULTIMEDIA12	11
-#define	MSM_FRONTEND_DAI_MULTIMEDIA13	12
-#define	MSM_FRONTEND_DAI_MULTIMEDIA14	13
-#define	MSM_FRONTEND_DAI_MULTIMEDIA15	14
-#define	MSM_FRONTEND_DAI_MULTIMEDIA16	15
-
-#define Q6ASM_DAI_TX_RX	0
-#define Q6ASM_DAI_TX	1
-#define Q6ASM_DAI_RX	2
-
-#endif /* __DT_BINDINGS_Q6_ASM_H__ */
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
deleted file mode 100644
index 39f203256c4f..000000000000
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ /dev/null
@@ -1,234 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DT_BINDINGS_Q6_AUDIO_PORTS_H__
-#define __DT_BINDINGS_Q6_AUDIO_PORTS_H__
-
-/* LPASS Audio virtual ports IDs */
-#define HDMI_RX		1
-#define SLIMBUS_0_RX    2
-#define SLIMBUS_0_TX    3
-#define SLIMBUS_1_RX    4
-#define SLIMBUS_1_TX    5
-#define SLIMBUS_2_RX    6
-#define SLIMBUS_2_TX    7
-#define SLIMBUS_3_RX    8
-#define SLIMBUS_3_TX    9
-#define SLIMBUS_4_RX    10
-#define SLIMBUS_4_TX    11
-#define SLIMBUS_5_RX    12
-#define SLIMBUS_5_TX    13
-#define SLIMBUS_6_RX    14
-#define SLIMBUS_6_TX    15
-#define PRIMARY_MI2S_RX		16
-#define PRIMARY_MI2S_TX		17
-#define SECONDARY_MI2S_RX	18
-#define SECONDARY_MI2S_TX	19
-#define TERTIARY_MI2S_RX	20
-#define TERTIARY_MI2S_TX	21
-#define QUATERNARY_MI2S_RX	22
-#define QUATERNARY_MI2S_TX	23
-#define PRIMARY_TDM_RX_0	24
-#define PRIMARY_TDM_TX_0	25
-#define PRIMARY_TDM_RX_1	26
-#define PRIMARY_TDM_TX_1	27
-#define PRIMARY_TDM_RX_2	28
-#define PRIMARY_TDM_TX_2	29
-#define PRIMARY_TDM_RX_3	30
-#define PRIMARY_TDM_TX_3	31
-#define PRIMARY_TDM_RX_4	32
-#define PRIMARY_TDM_TX_4	33
-#define PRIMARY_TDM_RX_5	34
-#define PRIMARY_TDM_TX_5	35
-#define PRIMARY_TDM_RX_6	36
-#define PRIMARY_TDM_TX_6	37
-#define PRIMARY_TDM_RX_7	38
-#define PRIMARY_TDM_TX_7	39
-#define SECONDARY_TDM_RX_0	40
-#define SECONDARY_TDM_TX_0	41
-#define SECONDARY_TDM_RX_1	42
-#define SECONDARY_TDM_TX_1	43
-#define SECONDARY_TDM_RX_2	44
-#define SECONDARY_TDM_TX_2	45
-#define SECONDARY_TDM_RX_3	46
-#define SECONDARY_TDM_TX_3	47
-#define SECONDARY_TDM_RX_4	48
-#define SECONDARY_TDM_TX_4	49
-#define SECONDARY_TDM_RX_5	50
-#define SECONDARY_TDM_TX_5	51
-#define SECONDARY_TDM_RX_6	52
-#define SECONDARY_TDM_TX_6	53
-#define SECONDARY_TDM_RX_7	54
-#define SECONDARY_TDM_TX_7	55
-#define TERTIARY_TDM_RX_0	56
-#define TERTIARY_TDM_TX_0	57
-#define TERTIARY_TDM_RX_1	58
-#define TERTIARY_TDM_TX_1	59
-#define TERTIARY_TDM_RX_2	60
-#define TERTIARY_TDM_TX_2	61
-#define TERTIARY_TDM_RX_3	62
-#define TERTIARY_TDM_TX_3	63
-#define TERTIARY_TDM_RX_4	64
-#define TERTIARY_TDM_TX_4	65
-#define TERTIARY_TDM_RX_5	66
-#define TERTIARY_TDM_TX_5	67
-#define TERTIARY_TDM_RX_6	68
-#define TERTIARY_TDM_TX_6	69
-#define TERTIARY_TDM_RX_7	70
-#define TERTIARY_TDM_TX_7	71
-#define QUATERNARY_TDM_RX_0	72
-#define QUATERNARY_TDM_TX_0	73
-#define QUATERNARY_TDM_RX_1	74
-#define QUATERNARY_TDM_TX_1	75
-#define QUATERNARY_TDM_RX_2	76
-#define QUATERNARY_TDM_TX_2	77
-#define QUATERNARY_TDM_RX_3	78
-#define QUATERNARY_TDM_TX_3	79
-#define QUATERNARY_TDM_RX_4	80
-#define QUATERNARY_TDM_TX_4	81
-#define QUATERNARY_TDM_RX_5	82
-#define QUATERNARY_TDM_TX_5	83
-#define QUATERNARY_TDM_RX_6	84
-#define QUATERNARY_TDM_TX_6	85
-#define QUATERNARY_TDM_RX_7	86
-#define QUATERNARY_TDM_TX_7	87
-#define QUINARY_TDM_RX_0	88
-#define QUINARY_TDM_TX_0	89
-#define QUINARY_TDM_RX_1	90
-#define QUINARY_TDM_TX_1	91
-#define QUINARY_TDM_RX_2	92
-#define QUINARY_TDM_TX_2	93
-#define QUINARY_TDM_RX_3	94
-#define QUINARY_TDM_TX_3	95
-#define QUINARY_TDM_RX_4	96
-#define QUINARY_TDM_TX_4	97
-#define QUINARY_TDM_RX_5	98
-#define QUINARY_TDM_TX_5	99
-#define QUINARY_TDM_RX_6	100
-#define QUINARY_TDM_TX_6	101
-#define QUINARY_TDM_RX_7	102
-#define QUINARY_TDM_TX_7	103
-#define DISPLAY_PORT_RX		104
-#define WSA_CODEC_DMA_RX_0	105
-#define WSA_CODEC_DMA_TX_0	106
-#define WSA_CODEC_DMA_RX_1	107
-#define WSA_CODEC_DMA_TX_1	108
-#define WSA_CODEC_DMA_TX_2	109
-#define VA_CODEC_DMA_TX_0	110
-#define VA_CODEC_DMA_TX_1	111
-#define VA_CODEC_DMA_TX_2	112
-#define RX_CODEC_DMA_RX_0	113
-#define TX_CODEC_DMA_TX_0	114
-#define RX_CODEC_DMA_RX_1	115
-#define TX_CODEC_DMA_TX_1	116
-#define RX_CODEC_DMA_RX_2	117
-#define TX_CODEC_DMA_TX_2	118
-#define RX_CODEC_DMA_RX_3	119
-#define TX_CODEC_DMA_TX_3	120
-#define RX_CODEC_DMA_RX_4	121
-#define TX_CODEC_DMA_TX_4	122
-#define RX_CODEC_DMA_RX_5	123
-#define TX_CODEC_DMA_TX_5	124
-#define RX_CODEC_DMA_RX_6	125
-#define RX_CODEC_DMA_RX_7	126
-#define QUINARY_MI2S_RX		127
-#define QUINARY_MI2S_TX		128
-#define DISPLAY_PORT_RX_0	DISPLAY_PORT_RX
-#define DISPLAY_PORT_RX_1	129
-#define DISPLAY_PORT_RX_2	130
-#define DISPLAY_PORT_RX_3	131
-#define DISPLAY_PORT_RX_4	132
-#define DISPLAY_PORT_RX_5	133
-#define DISPLAY_PORT_RX_6	134
-#define DISPLAY_PORT_RX_7	135
-
-#define LPASS_CLK_ID_PRI_MI2S_IBIT	1
-#define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-#define LPASS_CLK_ID_SEC_MI2S_IBIT	3
-#define LPASS_CLK_ID_SEC_MI2S_EBIT	4
-#define LPASS_CLK_ID_TER_MI2S_IBIT	5
-#define LPASS_CLK_ID_TER_MI2S_EBIT	6
-#define LPASS_CLK_ID_QUAD_MI2S_IBIT	7
-#define LPASS_CLK_ID_QUAD_MI2S_EBIT	8
-#define LPASS_CLK_ID_SPEAKER_I2S_IBIT	9
-#define LPASS_CLK_ID_SPEAKER_I2S_EBIT	10
-#define LPASS_CLK_ID_SPEAKER_I2S_OSR	11
-#define LPASS_CLK_ID_QUI_MI2S_IBIT	12
-#define LPASS_CLK_ID_QUI_MI2S_EBIT	13
-#define LPASS_CLK_ID_SEN_MI2S_IBIT	14
-#define LPASS_CLK_ID_SEN_MI2S_EBIT	15
-#define LPASS_CLK_ID_INT0_MI2S_IBIT	16
-#define LPASS_CLK_ID_INT1_MI2S_IBIT	17
-#define LPASS_CLK_ID_INT2_MI2S_IBIT	18
-#define LPASS_CLK_ID_INT3_MI2S_IBIT	19
-#define LPASS_CLK_ID_INT4_MI2S_IBIT	20
-#define LPASS_CLK_ID_INT5_MI2S_IBIT	21
-#define LPASS_CLK_ID_INT6_MI2S_IBIT	22
-#define LPASS_CLK_ID_QUI_MI2S_OSR	23
-#define LPASS_CLK_ID_PRI_PCM_IBIT	24
-#define LPASS_CLK_ID_PRI_PCM_EBIT	25
-#define LPASS_CLK_ID_SEC_PCM_IBIT	26
-#define LPASS_CLK_ID_SEC_PCM_EBIT	27
-#define LPASS_CLK_ID_TER_PCM_IBIT	28
-#define LPASS_CLK_ID_TER_PCM_EBIT	29
-#define LPASS_CLK_ID_QUAD_PCM_IBIT	30
-#define LPASS_CLK_ID_QUAD_PCM_EBIT	31
-#define LPASS_CLK_ID_QUIN_PCM_IBIT	32
-#define LPASS_CLK_ID_QUIN_PCM_EBIT	33
-#define LPASS_CLK_ID_QUI_PCM_OSR	34
-#define LPASS_CLK_ID_PRI_TDM_IBIT	35
-#define LPASS_CLK_ID_PRI_TDM_EBIT	36
-#define LPASS_CLK_ID_SEC_TDM_IBIT	37
-#define LPASS_CLK_ID_SEC_TDM_EBIT	38
-#define LPASS_CLK_ID_TER_TDM_IBIT	39
-#define LPASS_CLK_ID_TER_TDM_EBIT	40
-#define LPASS_CLK_ID_QUAD_TDM_IBIT	41
-#define LPASS_CLK_ID_QUAD_TDM_EBIT	42
-#define LPASS_CLK_ID_QUIN_TDM_IBIT	43
-#define LPASS_CLK_ID_QUIN_TDM_EBIT	44
-#define LPASS_CLK_ID_QUIN_TDM_OSR	45
-#define LPASS_CLK_ID_MCLK_1		46
-#define LPASS_CLK_ID_MCLK_2		47
-#define LPASS_CLK_ID_MCLK_3		48
-#define LPASS_CLK_ID_MCLK_4		49
-#define LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE	50
-#define LPASS_CLK_ID_INT_MCLK_0		51
-#define LPASS_CLK_ID_INT_MCLK_1		52
-#define LPASS_CLK_ID_MCLK_5		53
-#define LPASS_CLK_ID_WSA_CORE_MCLK	54
-#define LPASS_CLK_ID_WSA_CORE_NPL_MCLK	55
-#define LPASS_CLK_ID_VA_CORE_MCLK	56
-#define LPASS_CLK_ID_TX_CORE_MCLK	57
-#define LPASS_CLK_ID_TX_CORE_NPL_MCLK	58
-#define LPASS_CLK_ID_RX_CORE_MCLK	59
-#define LPASS_CLK_ID_RX_CORE_NPL_MCLK	60
-#define LPASS_CLK_ID_VA_CORE_2X_MCLK	61
-/* Clock ID for MCLK for WSA2 core */
-#define LPASS_CLK_ID_WSA2_CORE_MCLK	62
-/* Clock ID for NPL MCLK for WSA2 core */
-#define LPASS_CLK_ID_WSA2_CORE_2X_MCLK	63
-/* Clock ID for RX Core TX MCLK */
-#define LPASS_CLK_ID_RX_CORE_TX_MCLK	64
-/* Clock ID for RX CORE TX 2X MCLK */
-#define LPASS_CLK_ID_RX_CORE_TX_2X_MCLK	65
-/* Clock ID for WSA core TX MCLK */
-#define LPASS_CLK_ID_WSA_CORE_TX_MCLK	66
-/* Clock ID for WSA core TX 2X MCLK */
-#define LPASS_CLK_ID_WSA_CORE_TX_2X_MCLK	67
-/* Clock ID for WSA2 core TX MCLK */
-#define LPASS_CLK_ID_WSA2_CORE_TX_MCLK	68
-/* Clock ID for WSA2 core TX 2X MCLK */
-#define LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK	69
-/* Clock ID for RX CORE MCLK2 2X  MCLK */
-#define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
-
-#define LPASS_HW_AVTIMER_VOTE		101
-#define LPASS_HW_MACRO_VOTE		102
-#define LPASS_HW_DCODEC_VOTE		103
-
-#define Q6AFE_MAX_CLK_ID			104
-
-#define LPASS_CLK_ATTRIBUTE_INVALID		0x0
-#define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
-#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
-#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR	0x3
-
-#endif /* __DT_BINDINGS_Q6_AUDIO_PORTS_H__ */
diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
deleted file mode 100644
index f5e9f1db091e..000000000000
--- a/include/dt-bindings/sound/qcom,wcd9335.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
-
-#ifndef __DT_SOUND_QCOM_WCD9335_H
-#define __DT_SOUND_QCOM_WCD9335_H
-
-#define AIF1_PB                 0
-#define AIF1_CAP                1
-#define AIF2_PB                 2
-#define AIF2_CAP                3
-#define AIF3_PB                 4
-#define AIF3_CAP                5
-#define AIF4_PB                 6
-#define NUM_CODEC_DAIS          7
-
-#endif

-- 
2.44.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
