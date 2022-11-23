Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 188A0638449
	for <lists+uboot-stm32@lfdr.de>; Fri, 25 Nov 2022 08:12:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1DDAC65E45;
	Fri, 25 Nov 2022 07:12:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DBDEC6506F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 15:20:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2ANCvch2006435; Wed, 23 Nov 2022 16:20:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=UmeWENC0UcqsGYq4bYvtAHjvTzbHOYY0AVkEGrGPHT0=;
 b=6NReIbT658eok7Sio7UsGsRs4m675RJJrK2ULfHTCzAi6Hcm0vlRiTQzlARrMffTgBvp
 cjy/XJnHa++pcXfZdvQjQD5JXEmBc0RUwaCWeRYQHjXwTl+IHvqYO2xw4oN0A//ZaPRN
 2KEJiHY7s2L84PNSsKMrU9JauR95mLa1ZAppBA6yJ2wgvCJSK3+2PdZlgPRghRqaEZOm
 VDYY/o7rrVomfxVlGu764GpDWubHBIGKkhqhYNA9rNceMOSJzRxt5M2BY9ZpygP8MrIT
 4xrpfd7/DD8mgZojGOp3Hni5MerTPOtx+DszyWOFDpcOdpisMFVhN5kxRAk7rjWwyWZE 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kxrdchq6c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 16:20:23 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EADD5100038;
 Wed, 23 Nov 2022 16:20:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C6F4122A6DF;
 Wed, 23 Nov 2022 16:20:18 +0100 (CET)
Received: from localhost (10.252.10.13) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 16:20:18 +0100
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 23 Nov 2022 16:20:14 +0100
Message-ID: <20221123152016.27936-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.252.10.13]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_08,2022-11-23_01,2022-06-22_01
X-Mailman-Approved-At: Fri, 25 Nov 2022 07:12:21 +0000
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 0/2] adc: stm32mp15: add support of generic
	channels binding
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


Add support of generic IIO channels binding:
./devicetree/bindings/iio/adc/adc.yaml

Keep support of legacy property st,adc-channels for backward compatibility.
However, the st,adc-channels property is deprecated, and generic channel
bindings should be used instead.
Mixing of generic and legacy property is not supported. If generic channels
are present in the device tree, legacy properties will be skipped.


Olivier Moysan (2):
  adc: stm32mp15: split channel init into several routines
  adc: stm32mp15: add support of generic channels binding

 drivers/adc/stm32-adc.c | 83 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 10 deletions(-)

-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
