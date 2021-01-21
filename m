Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9843F2FF090
	for <lists+uboot-stm32@lfdr.de>; Thu, 21 Jan 2021 17:39:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AD58C56639;
	Thu, 21 Jan 2021 16:39:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9B9AC5660F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Jan 2021 16:39:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10LGL6lb003086; Thu, 21 Jan 2021 17:39:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=SKIF9wf1IFQeSUpD+lpnR4dVHc7O1pICcrOOPO68xUY=;
 b=NUX5mEOejnDmjnfuSkeqLk/DQJ5WeDb7jPoEDoQVQoScpdYcECZ3Lt92Y/43wHcVCwjG
 n/k9VxrfiHdRW+wOdzVVQbaV9vZ1iOdGjtUJLQKwS4hJoexxcp+tlKKKwmGs1BjbZBy1
 8RVKQyiA/yvK4m7ihmoaDOSB02H6CKe0WAXSiUGrBNposCozit7g2DTWOWZIS8GBrSxR
 FHwsuxaAQxcPEYkOa8dSk7f4f2y9cr7HW824y1KPdtR3Trt/uHxCnf/iWAa5CE1KGWEo
 fFmDdE7RK1pQgVlSfPB8iio7b56mAEXJsIuJdNIwn+Fny1iKSuGTSO6Hxq+Lk8hhevOg bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3668p54awp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Jan 2021 17:39:13 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6026010002A;
 Thu, 21 Jan 2021 17:39:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 57C552BA2CF;
 Thu, 21 Jan 2021 17:39:13 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Jan 2021 17:39:12
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 21 Jan 2021 17:39:08 +0100
Message-ID: <20210121173856.2.I0a3428974f4b9205c6a22076bf60c87639520b20@changeid>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
References: <20210121163908.17678-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-21_09:2021-01-21,
 2021-01-21 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 2/2] pinctrl: stm32: bind only the enabled
	GPIO subnode
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

Bind only the enabled GPIO subnode, to avoid to probe the node
"gpio-controller" present in SOC dtsi (disabled by default) but
not enabled in the included pincontrol dtsi file.

For example, in stm32mp15xxac-pinctrl.dtsi 2 gpio bank are absent:
 gpioj: gpio@5000b000
 gpiok: gpio@5000c000

Then these GPIO are absent in output of command "dm tree" and
"gpio status -a"

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/pinctrl/pinctrl_stm32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/pinctrl_stm32.c b/drivers/pinctrl/pinctrl_stm32.c
index 374f76d881..6c98538f56 100644
--- a/drivers/pinctrl/pinctrl_stm32.c
+++ b/drivers/pinctrl/pinctrl_stm32.c
@@ -409,6 +409,9 @@ static int stm32_pinctrl_bind(struct udevice *dev)
 	dev_for_each_subnode(node, dev) {
 		dev_dbg(dev, "bind %s\n", ofnode_get_name(node));
 
+		if (!ofnode_is_enabled(node))
+			continue;
+
 		ofnode_get_property(node, "gpio-controller", &ret);
 		if (ret < 0)
 			continue;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
