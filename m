Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A65954031B3
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70506C5A4D8;
	Tue,  7 Sep 2021 23:59:51 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95338C5A4F9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:48 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id s32so352271qtc.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsB3mjGBIUztuCqqDgNilfyksvtWHyQ9UeiFfnDXDVE=;
 b=C6ZrKH9f7c0yHvAwDDFALUu7kHhb6Knj9u4o2uWyPkC/QCAWbSYzFBdmNFSi1BEYoP
 xAemax4ZR4eDORZYx1Z4tH2XbH+KLnadVbAC7KL/bkI5IXHd/7Pgw2PwtaDKbGQ/g9cq
 usp9OhIF41RYFqEgthp8viN0GWTTHn0wdTjh6DJBKGRfoFUJL2/TkztI8BcvbuVYjUBm
 JxApHILAArpIITmm3QSmwvfeJChtkdhjEW3jc2SSW4kvaPkd+qaaSbDwLk7o3ne6t3kP
 oqJB8nAcDhrXH3Js/VSsQjPMbthFOvnpfhWT1aUaXaXCO6iRtr0n/6Q0GW5yDar82fKM
 niow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsB3mjGBIUztuCqqDgNilfyksvtWHyQ9UeiFfnDXDVE=;
 b=doNvN3SKHgVvFdLkeFRvO3XZCgeUJ2vDKiFRYT1zmFTlfNMpUpDkFmxJfYbfQl0WEn
 SvYHBK6xE/LLplAxAlBilkyoyWjCH9mC4YtZNbt2OpNBxWZe1txWE24r+1kY+vg7CMEA
 DjqcnPbrgxuorai4+abuKFJRgWfwfcUluplvE7deIxjEdYUINX44w9o3XO611vHpnSa4
 X+Ny46qTfm6E1dmFziQYLCpGjUL6iaELd5BIGRRZwDKlHHa8XEYFV3qXMKJSMGxJfB/f
 llGEG8r7GHHmEaz7alJJF1tFNeTXall1fWKtIWGhkmg25XJbNJZf3E/bbH23zTrIruKS
 deGw==
X-Gm-Message-State: AOAM531zyXqGpRgeV+ljgVZ/Yl4YBv3EXF60CVZKpgYfsCS78PVfYhA8
 acDg1ggL8PbSd+Vik8CP86E=
X-Google-Smtp-Source: ABdhPJxayehIACC60tXOLyTb06FwEa1nSGfZORgMifJqHxOvnMpGwDRMK5D9DtSvQhmYIHe7QRlA1w==
X-Received: by 2002:a05:622a:34c:: with SMTP id
 r12mr1025622qtw.147.1631059187696; 
 Tue, 07 Sep 2021 16:59:47 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:47 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:32 -0500
Message-Id: <20210907235933.2798330-11-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 10/11] ARM: dts: stm32mp: Add OP-TEE
	"/firmware" node to SPL dtb
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

The optee "/firmware" node is normally used to load the OP-TEE driver.
SPL does not use it this way, but instead uses it to patch the kernel
devicetree when booting OP-TEE. This seems weird, as OP-TEE -- which
would run after SPL -- is capable of patching the devicetree and
adding the required "/firmware" and "/reserved-memory" nodes.

However, OP-TEE's devicetree patching (CFG_DT=y) comes with a
significant boot time penalty. Measurements put it between 700 to 1800
milliseconds. SPL can also do this patching, without incurring a
measurable increase in boot time. This is the use case for falcon
mode, which is the main reason to launch OP-TEE from SPL.

Although some OP-TEE configurations do not require any pre-patching of
the devicetree, there are good use cases for doing so. As far as
concerns with adding the nodes twice, OP-TEE will not add the node if
it already-exists.

Add the "/firmware/optee" node the SPL devicetree.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
index b314ce2dac..7deb0f5d70 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -33,6 +33,7 @@
 		optee {
 			compatible = "linaro,optee-tz";
 			method = "smc";
+			u-boot,dm-spl;
 		};
 	};
 
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
