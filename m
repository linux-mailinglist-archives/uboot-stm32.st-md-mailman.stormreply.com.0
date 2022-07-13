Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB5573505
	for <lists+uboot-stm32@lfdr.de>; Wed, 13 Jul 2022 13:13:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E181DC640FC;
	Wed, 13 Jul 2022 11:13:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32491C640ED
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 11:13:06 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DAO31S003160;
 Wed, 13 Jul 2022 13:13:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=5JaeP35373kiQLptEu3Hm3Sgq+q0dmqykdNqIL1rgF8=;
 b=kFh3DmVivG1Mc5BQJ3mLV8IpOl0xPtrGjjbQwgoZtdUjG5w2pKQFELigbjr0X70fYgwW
 KE2ianNVGlApgqDVTwHx/pkI9vWrEXuZRktvqeGAsuB8W3hN0g0sEj/EszaTpIyHGh2+
 wnew2eovyegSxF1QRaURtJFvrFPctW30mF4D2PUaAGu0SjndpFZ8INlpR2z2m4O3XjPQ
 w7xQLjFvq8EucYgp8ipY/T3QAePumJS87LP53xmsTjN4DgaKukL1hLStH6wXIYokylj7
 by3YTOz8CbxZY83yGLXrCNDczpTuw0oFaOiRkgY0f2vozT7CYFenADP7LRDlX5zel50f +Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h9173sh0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 13:13:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1E59100034;
 Wed, 13 Jul 2022 13:13:03 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ED27321B52C;
 Wed, 13 Jul 2022 13:13:03 +0200 (CEST)
Received: from localhost (10.75.127.45) by EQNDAG1NODE6.st.com (10.75.129.135)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 13 Jul
 2022 13:13:03 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>, Patrick Delaunay <patrick.delaunay@foss.st.com>
Date: Wed, 13 Jul 2022 13:12:51 +0200
Message-ID: <165771069387.1352308.18351253710563296538.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706181934.1.I174d63cabaf30764ad59c73751d323a8b27fca60@changeid>
References: <20220706181934.1.I174d63cabaf30764ad59c73751d323a8b27fca60@changeid>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_02,2022-06-22_01
Cc: Tom Rini <trini@konsulko.com>,
 Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Lionel DEBIEVE <lionel.debieve@foss.st.com>,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 Etienne CARRIERE <etienne.carriere@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ARM: dts: stm32mp13: add OP-TEE nodes
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

On Wed, 6 Jul 2022 18:20:24 +0200, Patrick Delaunay wrote:
> Add the node for OP-TEE firmware with the associated reserved memory nodes
> 
> 

Applied to stm32/master, thanks!

[1/2] ARM: dts: stm32mp13: add OP-TEE nodes
      commit: 0b69ce6a816c39502941deb90543e23619e02896
[2/2] ARM: dts: stm32mp13: add SCMI nodes
      commit: 44db098ae1d91bde3bd52097ab3a1a52f5b4ed84

Best regards,
-- 
Patrick Delaunay <patrick.delaunay@foss.st.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
