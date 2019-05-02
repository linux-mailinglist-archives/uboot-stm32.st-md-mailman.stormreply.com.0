Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5231149E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:57:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCC22C0B792
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 07:56:59 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA7BEC0B791
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 07:56:58 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 13so419809pfw.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 00:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxBMIhSlZ0iN2r9oshAN0O8TfHfVGSNqeIrKU0PQGwI=;
 b=Q31brsvVYZlDlbgR0NZEQIR+vhz96ieDHZLqYmJ1hcSguFg0BiEXUflmx6Z++F/9ha
 WMxLESzozIMf/jaDxl+OptdpIZG0btIxGhs0WxtSvvsZcRIY4/scRReAP9xa7FoIqOrf
 fB8Ksc/dO5+UXrK+o5nIN4MkongopMmsup1mAQfeCLCiJDPt758Dg3GUDdjPbEXiSFic
 a7GVFg1iVfI/zEghSw8smjo5YAUgjMduADiNJANZ4IYirJF+ha+M1B4f+IsQYGB+Nefk
 zb81dymXv5EBQ8cURAMIcWv8BTK74fDM7ej+lTqLXLt7H66ic7mMmjorkLeotqNqFhVY
 FIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxBMIhSlZ0iN2r9oshAN0O8TfHfVGSNqeIrKU0PQGwI=;
 b=rsAo+yuK0N5bNXZwXiN0QLuhuG/NF2O21SL3VDHdd/IanikA2+i8xZvWh7IAg7Vk95
 jE2aqsy+DkDSxgzGeSLsRX38g5kN/bZmv1FIESLuBcN6gFGOF0vFfN37u7F4H5xhm9db
 pj18d6mr6h5Y6dkZeCbH2f3zvs4MMGpDdfM3hiqwUzAsbW7bBWbUrLWDjXHFx6z416Jj
 huZ+DGV4h8/mMYJdWSzsx51n8X+0hyDxcuU6tmqgtR7B9NIy8GzqKAtDWRZyySKYlUNe
 y3cxD9oihGSfFEwbdcfqt8bq1JX6GPD/uMLsG1Pl87kv6Sp5tSeMRrJjdRpvk7LRug8O
 aqUA==
X-Gm-Message-State: APjAAAU0hwW6zPeWU52Ct0hmaCjuLJrGJ0zgAvo6z151OQlFaON0QHfL
 KIFls7/OIdEpsp5IsuJ6hi4M
X-Google-Smtp-Source: APXvYqw7MTe9VtY18L4LVHicWgJzprMzDXjsbZXCusI1EhqDjNf6qq30i2mjV5S0w1CHnDvY/Hlzug==
X-Received: by 2002:a65:63d5:: with SMTP id n21mr2579623pgv.330.1556783817131; 
 Thu, 02 May 2019 00:56:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4072:6284:a261:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id n18sm63780910pfi.48.2019.05.02.00.56.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 00:56:56 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: patrick.delaunay@st.com, christophe.kerello@st.com, patrice.chotard@st.com,
 trini@konsulko.com
Date: Thu,  2 May 2019 13:26:42 +0530
Message-Id: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [Uboot-stm32] [PATCH v2 0/3] Add Avenger96 board support
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

Thanks,
Mani

Changes in v2:

* Added missing `u-boot,dm-pre-reloc` property to UART and SDMMC nodes
  and verified SPL boot.

Manivannan Sadhasivam (3):
  arm: dts: stm32mp157: Add missing pinctrl definitions
  board: stm32mp1: Add Avenger96 board support
  arm: mach-stm32mp: Add newline to the MAC error message

 arch/arm/dts/Makefile                         |   1 +
 arch/arm/dts/stm32mp157-pinctrl.dtsi          |  63 +++
 .../arm/dts/stm32mp157a-avenger96-u-boot.dtsi | 191 +++++++++
 arch/arm/dts/stm32mp157a-avenger96.dts        | 362 ++++++++++++++++++
 arch/arm/mach-stm32mp/cpu.c                   |   2 +-
 board/st/stm32mp1/README                      |  23 ++
 6 files changed, 641 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/dts/stm32mp157a-avenger96-u-boot.dtsi
 create mode 100644 arch/arm/dts/stm32mp157a-avenger96.dts

-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
