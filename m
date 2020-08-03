Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368C23A06D
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Aug 2020 09:38:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 438BBC36B38
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 Aug 2020 07:38:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74FA4C36B32
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Aug 2020 07:37:59 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0737aPwl023883; Mon, 3 Aug 2020 09:37:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=uSnkhKtmLqvI9/UN8IVWrTJokmX80c/0tCFdwp5IOQQ=;
 b=OEjt2fOqExu0alw4D+WLfrAPsNdPg2sDpEA2e+CjcfhOlxLCJRIcAdEz4j+ZR5x/Q+XO
 00TMbA9XHS0y0rshoR6gzdbzRtnEsSLh2ltsGhdJQUJzTHjnUwOCQqj1jo/CfSzCknBC
 57EYPZHybv+8Gyxgh+drJB8ud6jaGtiGcCefrIzVQ/Ysh5i4ZoJruje5xyQPwGZEi6P1
 /ndWEHchvWSIN2MT82s7ExG0pnLpsP6kjH3J9wVgLfsbfjzfHmoR65H7h6FqIp5hP/0v
 SbB6ste27BM6pdY+B6L3cToV5gMb0bKezu30T3a3T5L4qKFCccj5Y6BJC3SiFzWchKzj Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32n6sawcb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 09:37:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 05EDC10002A;
 Mon,  3 Aug 2020 09:37:51 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D352C221F05;
 Mon,  3 Aug 2020 09:37:51 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 3 Aug
 2020 09:37:51 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 3 Aug 2020 09:37:51 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Marek Vasut <marex@denx.de>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [RESEND][PATCH] usb: host: dwc3-sti-glue: Fix ofnode_valid()
 parameter
Thread-Index: AQHWZw6FFrgWD9lwrkKD9z+eZinQCakh1auAgAQMrIA=
Date: Mon, 3 Aug 2020 07:37:51 +0000
Message-ID: <27b24d37-80c8-75cc-faa8-6b62afef44fc@st.com>
References: <20200731074505.25642-1-patrice.chotard@st.com>
 <7377ea66-4f59-ae61-b513-43f13c53a65c@denx.de>
In-Reply-To: <7377ea66-4f59-ae61-b513-43f13c53a65c@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <40E561C3F4E2DF4884453A09E625399E@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_07:2020-07-31,
 2020-08-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [RESEND][PATCH] usb: host: dwc3-sti-glue: Fix
 ofnode_valid() parameter
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


On 7/31/20 7:47 PM, Marek Vasut wrote:
> On 7/31/20 9:45 AM, Patrice Chotard wrote:
>> node varaible is used as iterator into ofnode_for_each_subnode()
>> loop, when exiting of it, node is no more a valid ofnode.
>> Use dwc3_node instead as parameter of ofnode_valid()
>>
>> Fixes: ac28e59a574d ("usb: Migrate to support live DT for some driver")
> Looks OK to me, feel free to pick it via ST tree.

Ok thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
