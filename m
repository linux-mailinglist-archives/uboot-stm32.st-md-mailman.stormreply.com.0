Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B727615D5C5
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 11:31:31 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 815DFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Fri, 14 Feb 2020 10:31:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDFEDC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Feb 2020 10:31:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01EAMsb8031486; Fri, 14 Feb 2020 11:31:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=LasYUVjZ6F/bTS515b6CPvdKcwnuBMpg3Amt9bNlIkU=;
 b=a9ymd4m3fwOCHgOvTsmBrRDB1hLQPRb/eY14j86GdmrSnHaY+YxxgbzMp8r2Y+QantQ5
 gpgl6I9++9q7k1N/T1okElmX3OxIpVFI39gzKNF53mfnHaD4w4KC7il5G945c17fRpTH
 FQj1bzcIiW+V6R14lymiOoJv1idCcDKSQKD1gDQAcmHrJMSfTDmaOpaF82fTMSMgnXXl
 F99lUn2UJ/pozyOrQvrKEbVJYKjZDUPxLP/TMseKssuaC8AUmecHYynJegjqW3S4DbLx
 fe8C2DnyZtoYr53TVo9DolC/O3+LSTd1Pxj8pogEopD4IrhP08HOaZnai9GpRb8XjdZK 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ufhu8sh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Feb 2020 11:31:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 41C3010002A;
 Fri, 14 Feb 2020 11:31:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A5E62AC885;
 Fri, 14 Feb 2020 11:31:23 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 11:31:22 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Fri, 14 Feb 2020 11:31:22 +0100
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/4] pinctrl: stmfx: update the result type of
 dm_i2c_reg_read
Thread-Index: AQHV1b+D1kmQQShf0kaN4NmgCV/MxqgamDMw
Date: Fri, 14 Feb 2020 10:31:22 +0000
Message-ID: <1c9d7de3153e4d3f9f3c5f1ab72775fd@SFHDAG6NODE3.st.com>
References: <20200128094415.5768-1-patrick.delaunay@st.com>
 <20200128094415.5768-4-patrick.delaunay@st.com>
In-Reply-To: <20200128094415.5768-4-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-14_02:2020-02-12,
 2020-02-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice CHOTARD <patrice.chotard@st.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] pinctrl: stmfx: update the result
 type of dm_i2c_reg_read
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

Hi,

> From: Patrick DELAUNAY <patrick.delaunay@st.com>
> Sent: mardi 28 janvier 2020 10:44
> 
> Use int as result of dm_i2c_reg_read to avoid warning with
> W=1 (warning: comparison is always false due to limited range of data type [-
> Wtype-limits])
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---

Applied to u-boot-stm32/master, thanks!

Regards
Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
