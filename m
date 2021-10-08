Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DD44271A8
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37F5AC597B9;
	Fri,  8 Oct 2021 19:57:13 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2F0EC597B9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:11 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 r43-20020a05683044ab00b0054716b40005so12987481otv.4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ncznSRDaTfVl26/yRSF29JA0nsKYf7/2VaOASI8t00=;
 b=LAPM/RwqCv46wpIx3noz8lqtA2+0dMxm3B1aAwig46xxnk7bdrSEPVvesTCrOlcnD/
 ytFg2g+otyebbBAXjGAVDmZzx5endngSA8IcAqweAKHGd/o4fyK6eCa036sZD5rzWF6N
 1Wq5A+IypdQ0QIQeV67uwOzW+jy24gxjSz5z5r4qyx7e51SNbfZe7fGEIQjXf8fImtWe
 qkWkX2gb+cFLTSVDBAeblz3GWHxccznOi49b0fvF3KbfBz5C/uFSzDJXtHOE7v3oXDbe
 Ngs6praJ9LLMxhR5GhUJ2ZTXk5XRg2Z0tD6vU6SDOP7LhA0hHRZ9A2IYGATyoMoIvTpV
 qjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ncznSRDaTfVl26/yRSF29JA0nsKYf7/2VaOASI8t00=;
 b=pq+e9XXuQtgZVcESfSuorBaqyuhVgL9+RRTsiPZnTmfqdQIpqbuSbYYAvGLWmvXBh2
 MlLyFl4msitqsbZ7tXyck7skQvxyTMCrxVoU09Yq9c6gQ3J0K65VJaPODmxqYDEFYw9F
 S7TEY3HO6jgTVJE0ARwOde0Ve+hiuo8f8UsB8Ko4ef/bvkY8xYscBER1RxxyhDiCxKCt
 B23seOzCMTVjoj3cChH0lKRVq9Cpn7y9fuV/LVLJJ7dYr1E6cZP2pDhJyV1mwIv3QzDV
 EoJPhyMN3jk6Y5JN/Q+QB9vfXdDQdAP76YllaRrP7ZwIotQwCCAs+ndm9UsvdPpp+wlM
 M8Mw==
X-Gm-Message-State: AOAM532+oX87PDBA5vuuWfYk8FFeGUcboGpYBhalh9SySW81DurVxEW8
 c4v5nzTyz8mEJOIYxiF6LP65XRBMeEc=
X-Google-Smtp-Source: ABdhPJwyudm92C8A1CuSvz3w7N0cuyDuhWFGpm4Fsaun7jqmokhTsyHrNrZz4ZSQoSlYoY40H6jVCQ==
X-Received: by 2002:a05:6830:31ae:: with SMTP id
 q14mr10520408ots.66.1633723030937; 
 Fri, 08 Oct 2021 12:57:10 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:10 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:53 -0500
Message-Id: <20211008195655.46046-12-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 11/13] ARM: dts: stm32mp: Add OP-TEE
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
index 629451e731..fb60549f4d 100644
--- a/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
+++ b/arch/arm/dts/stm32mp157a-dk1-u-boot.dtsi
@@ -35,6 +35,7 @@
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
