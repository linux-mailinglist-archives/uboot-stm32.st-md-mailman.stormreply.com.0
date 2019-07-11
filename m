Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFAA65406
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jul 2019 11:41:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA831D1B548
	for <lists+uboot-stm32@lfdr.de>; Thu, 11 Jul 2019 09:41:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50CD5D1B547
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jul 2019 09:41:33 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6B9dxq7012381; Thu, 11 Jul 2019 11:41:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ZLcN1vjxXa3Xo0ZlDW6tJVnJ9fNYPhN+Do4Mhdo8NnM=;
 b=FF2nk2A6TjPCFMaQbKB4qIuji84ozi2rSbcnSto6rSKLT4vCPewT1lFWN6jAqgrT7Yb7
 6NxeZFYaLrhJpz/dzUImbmXMvEgXCIQoZ8r/VUhC1PGvuAKbKSa/9StR0ZjRBv9xMu/H
 wyc4GZQbNcGuqA20cE4JfuTlMrgrOkBaJtn3jJO7dNWbiEaUMrzv95uExyAHcs2xVaXs
 TLv/8GALYflgSTTLkJCCfzpBwhKdYGMyydBTF/SwXomb/sEOasiwRNtNKMDteFJ9zCrL
 ubfyTAFZU+kekzWcS3VGhfXYYghBliOM57akf1BQq607cAXUCBTTagysMATfv/ZGY5fk /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2tjgsaaky0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 11:41:31 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2733431;
 Thu, 11 Jul 2019 09:41:31 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 047592719;
 Thu, 11 Jul 2019 09:41:31 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 11 Jul
 2019 11:41:30 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 11 Jul 2019 11:41:30 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, "sjg@chromium.org" <sjg@chromium.org>
Thread-Topic: [PATCH v2] rtc: Add rtc driver for stm32mp1
Thread-Index: AQHVNlSJjRuqXnUj6kSsOOWRqIKDEKbFLIog
Date: Thu, 11 Jul 2019 09:41:30 +0000
Message-ID: <4b12846d9f6a47138b19a97c3c52d6d7@SFHDAG6NODE3.st.com>
References: <20190709124742.10090-1-benjamin.gaignard@st.com>
In-Reply-To: <20190709124742.10090-1-benjamin.gaignard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-11_01:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2] rtc: Add rtc driver for stm32mp1
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

Hi Benjamin,

> From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
> Sent: mardi 9 juillet 2019 14:48
> 
> Add support of STM32MP1 rtc driver.
> Enable it for basic and trusted configurations.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - release clock on on error cases.


In V2, you also drop a part of the initial patch v1 for clock entry

[PATCH 1/2] clk: stm32mp1: Add RTC clock entry

So RTC is not functional.
Can you sent a v3 with the missing part.

Regards,

Patrick
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
