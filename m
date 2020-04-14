Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7E31A771B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:12:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DE6DC36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:12:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DA7CC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:12:23 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9Brng014770; Tue, 14 Apr 2020 11:12:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5m44oq7IH4449fsDZbD/8bIx21nwjxLl2knF7ZxQDV4=;
 b=btUrzwJ5Hw1x+/a7QWDfAY9cJjSgu1imd7IHfooo7Vgd1h+Oa0DtIUz1ifx7mTS/aQza
 cMrtvGY3rxkllB7nlQ4s2jAaOE5JAPfTQC8W75VbNDUBvzAvIoDcAQjcgyQHtO3E7ppV
 b4YpUaRV3ZlsAu5jWZHx3G/h9elAX4I0OFW8BjD+PGPRUoT7/UU2h1u+d8RS3F7x0s9Y
 lsULohwuPRQOf9G45zQi0INs1zvJBO5jjkWyM/3Fh9k+sS7CaOQaKpx2SFJ/a1zAWJgy
 Gh0yVpEgGWrI18f7UAlHPiRKetfHUN69pbdVmbis9vgtmSYGmy47i4dnarkIoYoEFe4g kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b5sjvp2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:12:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A3E7100038;
 Tue, 14 Apr 2020 11:12:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 215172AAA02;
 Tue, 14 Apr 2020 11:12:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 11:12:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:12:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Marek Vasut <marex@denx.de>, Patrick DELAUNAY <patrick.delaunay@st.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH] arm: stm32mp: cleanup test on eth_env_set_enetaddr result
Thread-Index: AQHWDOXre3x1weWeC0maijfnf5rF86htkReAgAqtKAA=
Date: Tue, 14 Apr 2020 09:12:14 +0000
Message-ID: <d32c8d8d-2ab4-1476-551f-39a285467cf4@st.com>
References: <20200407160742.1.Iff22fd0c4f1e9a7fd23f632f06e6f13bef768c53@changeid>
 <8577e6a3-4fe9-e5f5-0ba4-55185ac24e86@denx.de>
In-Reply-To: <8577e6a3-4fe9-e5f5-0ba4-55185ac24e86@denx.de>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <5C64CE3C10B310458D89182871254892@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Tom Rini <trini@konsulko.com>, Wolfgang Denk <wd@denx.de>
Subject: Re: [Uboot-stm32] [PATCH] arm: stm32mp: cleanup test on
	eth_env_set_enetaddr result
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

Hi

On 4/7/20 4:09 PM, Marek Vasut wrote:
> On 4/7/20 4:07 PM, Patrick Delaunay wrote:
>> Remove the unnecessary inversion on the eth_env_set_enetaddr() result which
>> only make complex the code of setup_mac_address() and display an invalid
>> value in the associated pr_err.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied to u-boot-stm/next

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
