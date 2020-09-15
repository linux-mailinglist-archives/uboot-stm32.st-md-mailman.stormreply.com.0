Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 674D826A776
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 16:46:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31D76C3FADE
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Sep 2020 14:46:13 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ED00C3FADE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 14:46:11 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r8so3296347qtp.13
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Sep 2020 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jmGZv03eVj3y+UaR089wbAFrC/EYvkaU8sSNIY1jpj4=;
 b=TFJK/RPY+3MmsvKEUhLwrk77YwPYZEJRUQ1eEU7nOSpHbB7F4i6qFJ8Fo7UPO9hbH4
 pRJNmViBIeQicl3o8hS2BWjz3g0j8OScjGCfUxOyQHruS9TwgodyHbfnUOBz/sCnKbF/
 fTXK6bFGXFs0kyB/NUeGXoxQ2/1FzBle8NCXxFenBYBRukS96Il1/FnsDaQqeJw01J8M
 ykLvxofwvzBoLx/RuHHRnh1QIm2LGTCtoLAHEVSZE2sH5qSoLZlKdHH0CEu36nyDx1PZ
 uuz98SbQrm21SFskDDH+NTYSjRfLvZovXGr5j+xg7o1rto9Y6TuX8dvBTJXW3V6qPFvq
 j8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jmGZv03eVj3y+UaR089wbAFrC/EYvkaU8sSNIY1jpj4=;
 b=lXbV/xRvIkgIiZXjvruSGW8vzUcrI/Z4+V99FyfFCWj+aamOmU16HdD5LyO3HVIQh4
 4YFdiJ4Ngy3Gx85dysJWNKbeUHNwNISSa7rlpTxIZi4P6TDhq9xWQ8oqalRu5fQJwop8
 P38VpoBHGuxzUizGPmwdABlWqeWmF8oIi0NHxZSMGavqtaMHuOdfZUL9paCj0hfOgP3u
 m31SvKund7HpF3JN3f87VBUqrSvzD46EKGd4nzFO79+o2f3IqfQgShize7SSoX1hLvVX
 F1HBhjWTCX1epMF/P+ycefp14O0k4fyVvBpyGaZlJDYjhGn4l/AxRF9iisiOhuQNcdm3
 oP0g==
X-Gm-Message-State: AOAM533xJMveKweDJGFYiDQT8Oh+96ye4tIEMbpNZfm4zjaA6PW6ofLy
 auwAjtClYJe+RisNimLKkQMO2jSOR9PMySgJ
X-Google-Smtp-Source: ABdhPJyKi/9YuzyJfB5InACUtQ6qErFFgfU9Cz0SxSmW8gVn1G1o3pP9d70oiD5XFsa/67SoFOlb/A==
X-Received: by 2002:ac8:1b3d:: with SMTP id y58mr17919025qtj.10.1600181170418; 
 Tue, 15 Sep 2020 07:46:10 -0700 (PDT)
Received: from godwin.fios-router.home
 (pool-108-51-35-162.washdc.fios.verizon.net. [108.51.35.162])
 by smtp.gmail.com with ESMTPSA id g18sm16371799qko.126.2020.09.15.07.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 07:46:09 -0700 (PDT)
From: Sean Anderson <seanga2@gmail.com>
To: u-boot@lists.denx.de
Date: Tue, 15 Sep 2020 10:45:06 -0400
Message-Id: <20200915144522.509493-31-seanga2@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915144522.509493-1-seanga2@gmail.com>
References: <20200915144522.509493-1-seanga2@gmail.com>
MIME-Version: 1.0
Cc: uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 30/46] phy: usbphyc: Fix not calling
	dev_err with a device
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

Use the phy's device.

Signed-off-by: Sean Anderson <seanga2@gmail.com>
---

Changes in v2:
- New

 drivers/phy/phy-stm32-usbphyc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-stm32-usbphyc.c b/drivers/phy/phy-stm32-usbphyc.c
index c6d3048602..9d4296d649 100644
--- a/drivers/phy/phy-stm32-usbphyc.c
+++ b/drivers/phy/phy-stm32-usbphyc.c
@@ -311,7 +311,7 @@ static int stm32_usbphyc_of_xlate(struct phy *phy,
 
 	if ((phy->id == 0 && args->args_count != 1) ||
 	    (phy->id == 1 && args->args_count != 2)) {
-		dev_err(dev, "invalid number of cells for phy port%ld\n",
+		dev_err(phy->dev, "invalid number of cells for phy port%ld\n",
 			phy->id);
 		return -EINVAL;
 	}
-- 
2.28.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
