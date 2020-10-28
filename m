Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A399F29CF53
	for <lists+uboot-stm32@lfdr.de>; Wed, 28 Oct 2020 10:52:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69286C3FAD5;
	Wed, 28 Oct 2020 09:52:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E240C36B0B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 09:52:02 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09S9ktog000510; Wed, 28 Oct 2020 10:52:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=/mqVequm4uW44ZlYLu5nZea3rwFN4YJiB2+LHsWFbvw=;
 b=SEudasqjvybzSf6LYhGyC7wOpPAtC7GRdW4O9L6hX1UZiwcHIVivMryGX1xKF9ObrMVs
 HyuCAFHNrfN+mC0Ho3Foi7vCmcyFgnDmdNhxM0qXf/v05Pj3CS7zOfBLPMYVbMZaDSB2
 p6OhM+ieg/MfBljD/f/AocRq1sgazoIqs7jk0mpCpXC5JiErmFnb54q2pHVf7mO+0FW/
 sYLPcZAjrOeKZRkMp1xKCg0W2LdQSEaoix6wLU4MTBPD5XBZhhBIW0Wkb25/1SEs0+hb
 BS2TcCxyrkEDgxGE5exUntRchyqgUSqaYbIoVqQUHQAZ+igQ65cDxEyV9DcSEAF12AMi 0Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccf3rdjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 10:52:01 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BC4F110002A;
 Wed, 28 Oct 2020 10:52:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 97F922A4D97;
 Wed, 28 Oct 2020 10:52:00 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct 2020 10:52:00
 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 28 Oct 2020 10:51:56 +0100
Message-ID: <20201028095157.11327-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_04:2020-10-26,
 2020-10-28 signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, Simon Glass <sjg@chromium.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 1/2] pinctrl: stmfx: update pincontrol and
	gpio device name
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

The device name is used in pinmux command and in log trace
so it is better to use the parent parent name ("stmfx@42" for
example) than a generic name ("pinctrl" or "stmfx-gpio")
to identify the device instance.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 drivers/pinctrl/pinctrl-stmfx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index c2ea82770e..b789f3686c 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -408,8 +408,11 @@ static int stmfx_pinctrl_bind(struct udevice *dev)
 {
 	struct stmfx_pinctrl *plat = dev_get_platdata(dev);
 
+	/* subnode name is not explicit: use father name */
+	device_set_name(dev, dev->parent->name);
+
 	return device_bind_driver_to_node(dev->parent,
-					  "stmfx-gpio", "stmfx-gpio",
+					  "stmfx-gpio", dev->parent->name,
 					  dev_ofnode(dev), &plat->gpio);
 };
 
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
