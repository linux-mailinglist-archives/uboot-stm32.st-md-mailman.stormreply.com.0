Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9422E222
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 14:21:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D044C35E04
	for <lists+uboot-stm32@lfdr.de>; Mon, 29 Apr 2019 12:21:22 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22C63C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 12:04:16 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id z26so1328806pfg.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Apr 2019 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALOigroTVHuzKfLdVvYBGx6QjUV7wW9ziZOqB4v9bo0=;
 b=qk1H8mGjAQIhz/zb2KvM1Sfy8A7dgeNPZJEWibaNuG6jKi+ifN0BIXAX7tYBWs4/bH
 pt3CRZtU+Aw26e9cFF+yMyhhwEDJcMT/LApCe2qVsydXtAd9TM3HvfzzCDOv4qNtkXL7
 zWYue5zpw/XpKxWRwKPqZ+xeO6rji4ySITUpdsl5hlNlOsCldUn0/mX33WBxK+r/4sFB
 /bFXcCIWrnhVTB6IuNIzsrnwGN8qBMQ2QjO4hi0o/qkA3TffsJVxRNVmI7O2wgAe56dF
 27jx9pCiNU76p1dVUiYFy1PCMlZrFRCCLFYPaYztkeCBsolCGhXCdRNkisTiXYMKwMTH
 kQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ALOigroTVHuzKfLdVvYBGx6QjUV7wW9ziZOqB4v9bo0=;
 b=qtgwBLXXIchEatq2slkdg0Netg5zLAd2/3tblAjWqR6LW8OCx49eu0cDUS8mxiXHJh
 634sT2G+kgFgjnksY1PgPvbJUobwva9cjf3/RH5qDqnZ53i/re85PrrulG/QMyVI/WiD
 vTDnySmqEQP980xvBerrcIk6O3SpKuT57VDbihKKoccva5V1foROq2T5G+UL38ZYz8i9
 6KkuCgP1QzxEsXPnwbaBjpiXn/JK1ZGa62zIo7vHOSCZ9vRccljXAk3InRyspyRXUYEU
 gN+Qf3xfPP0Q1YnWi6ykZThrneUtqDUEgflcEuO5AH1yxPbVHB0yjjYg+x3nRV0hUrFC
 eoEQ==
X-Gm-Message-State: APjAAAV7WIToVBK7ZcH+19/VR1twAd9rE6NmKwfIai2F7dIx0xxgMq5m
 koQ0f9wiYundkLmNyA5udJB/
X-Google-Smtp-Source: APXvYqxs2paf4eV8mYaxsUDt0+242E2EtOhtHDcdhIKL7b2PEg53qICHzryvY6HwSqROo5lPG1CK2Q==
X-Received: by 2002:a63:da51:: with SMTP id l17mr16818131pgj.115.1556539454392; 
 Mon, 29 Apr 2019 05:04:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:7241:e9f8:e0e7:64d9:38a4:57a4])
 by smtp.gmail.com with ESMTPSA id u66sm3098277pfb.76.2019.04.29.05.04.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 05:04:13 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: patrick.delaunay@st.com, christophe.kerello@st.com, patrice.chotard@st.com,
 trini@konsulko.com
Date: Mon, 29 Apr 2019 17:33:56 +0530
Message-Id: <20190429120359.23332-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Apr 2019 12:21:21 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Uboot-stm32] [PATCH 0/3] Add Avenger96 board support
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

Hello,

This patchset adds board support for Avenger96, a 96Boards Consumer
Edition board from Arrow Electronics. This board is based on the
STM32MP1 MPU and the board support is added under st boards since
there are no significance changes required to boot u-boot on this
board other than the dts.

More information about this board can be found in 96Boards website:
https://www.96boards.org/product/avenger96/

PS: I only managed to boot u-boot as SSBL with TF-A as FSBL. U-boot
SPL way of booting is not working.

Thanks,
Mani

Manivannan Sadhasivam (3):
  arm: dts: stm32mp157: Add missing pinctrl definitions
  board: stm32mp1: Add Avenger96 board support
  arm: mach-stm32mp: Add newline to the MAC error message

 arch/arm/dts/Makefile                         |   1 +
 arch/arm/dts/stm32mp157-pinctrl.dtsi          |  63 +++
 .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 177 +++++++++
 arch/arm/dts/stm32mp157a-avenger96.dts        | 362 ++++++++++++++++++
 arch/arm/mach-stm32mp/cpu.c                   |   2 +-
 board/st/stm32mp1/README                      |  23 ++
 6 files changed, 627 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-avenger96.dts

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
