Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E33005B567B
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:42:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9753FC04003;
	Mon, 12 Sep 2022 08:42:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B9D0C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:42:14 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C4YL8O017745;
 Mon, 12 Sep 2022 10:42:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=EKk8bzDAn1OPI11krlAdlrvpjCsarr04h6LgjAOyRbA=;
 b=kT/Wjf5OWuIzbpQwWpVAEd7+P0uIKzHE/u+c3M2knGl5JQesd9WNQ86UM9fAj86OM08u
 zhzra7VWz7RC3LJSZLxqgvNNWxKH284x3snMW/8e05bX7xs7dbcTqoIh+CQ3MVVpKbqZ
 rF1WJZPLl3eH7nVNtk4ZYy/8bWQd9PC/LHpzdW4G098KpwoC/MbPtkzOtih/jrErlLzd
 kFTmlfqQX2SM6Y99lvdyfSGJpXvgh5eyTWACSDyMHBVrIMJU6YNLlqG5hKTGE0gA5X3L
 i2mGn2+A5HgZ8hnL3IHCM5HvJIEefIxdBLXJLUdw38G7UvAuXTpoqSeALwWmfuWug14E WQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjwv0kph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:42:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2663E10002A;
 Mon, 12 Sep 2022 10:42:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21B8B217B9F;
 Mon, 12 Sep 2022 10:42:12 +0200 (CEST)
Received: from localhost (10.75.127.116) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:42:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
Date: Mon, 12 Sep 2022 10:41:57 +0200
Message-ID: <20220912084201.1826979-1-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.116]
X-ClientProxiedBy: GPXDAG2NODE6.st.com (10.75.127.70) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_05,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: [Uboot-stm32] [PATCH v4 0/4] i2c: stm32: cleanup & stop handling fix
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

This series corrects the handling of the stop condition and
cleanup few bits in the driver stm32f7_i2c.c

v4: additional patch to fix rise/fall timing settings
v3: fix stop handling in patch 3/3
v2: update commit message in patch 3/3

Alain Volmat (3):
  i2c: stm32: fix comment and remove unused AUTOEND bit
  i2c: stm32: remove unused stop parameter in start & reload handling
  i2c: stm32: do not set the STOP condition on error

Jorge Ramirez-Ortiz (1):
  i2c: stm32: fix usage of rise/fall device tree properties

 drivers/i2c/stm32f7_i2c.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
