Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34A1BF380
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 10:51:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBA7DC36B0C
	for <lists+uboot-stm32@lfdr.de>; Thu, 30 Apr 2020 08:51:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CEE4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Apr 2020 08:51:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03U8gNeD016155; Thu, 30 Apr 2020 10:51:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pfr4OCYBDPcWAjToH/6v/v8xvLA37nqRC9aAw3Hao7I=;
 b=xTSQOTJohrnKIuIZyDYY3rTrmMfEGnW/YKTVObrS+3aJOx1zYr3NSJFpY4CIOJPEdpI3
 REzYje/oX8lW/c5MYVd+22deS05RDmbOS9xv720w8wPqEEeBTW/Oe15YvLNkul48cgSy
 wNDccldJOy/6E4/TxfzBz6QLi8ow8LboMDHlEPP00/vyg314ubB79Pb+LtektV5vXEKQ
 UfSox52Z/WLBG/70rmg3Flqr2JkooZ9x+D9jV+Bd2j0xx9hNaGRMXE9G2izLH7yzX11w
 lwk+9SNnrzao0PZz6dW+p+RLzVbHj3XRZnDaQXgZMDxJJM4NOp9HOf4XmhE1qSA0dBTo xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30n4j679u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 30 Apr 2020 10:51:08 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E89710002A;
 Thu, 30 Apr 2020 10:51:07 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 559F82AE6B6;
 Thu, 30 Apr 2020 10:51:07 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 30 Apr
 2020 10:51:06 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 30 Apr 2020 10:51:06 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Simon Glass <sjg@chromium.org>
Thread-Topic: [PATCH v2 4/5] test/py: Update test_bind
Thread-Index: AQHWHiCXU6DK9dPT9kaqYMq62raEAaiQQ2YAgAD3ygA=
Date: Thu, 30 Apr 2020 08:51:06 +0000
Message-ID: <4ad10c67-d711-2629-0c7c-aa12bd44ef51@st.com>
References: <20200429122031.31279-1-patrice.chotard@st.com>
 <20200429122031.31279-5-patrice.chotard@st.com>
 <CAPnjgZ3Gyhtx-m=piYrbfiWRa+aLW7RUuynPcqkG+O08RNY8_w@mail.gmail.com>
In-Reply-To: <CAPnjgZ3Gyhtx-m=piYrbfiWRa+aLW7RUuynPcqkG+O08RNY8_w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <3E3FE7A8D1CB964BA4202CE197381633@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-30_03:2020-04-30,
 2020-04-30 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 4/5] test/py: Update test_bind
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

Hi Simon

On 4/29/20 8:04 PM, Simon Glass wrote:
> On Wed, 29 Apr 2020 at 06:20, Patrice Chotard <patrice.chotard@st.com> wrote:
>> As bind-test is now binded at sandbox startup and no more by
>> test_bind.py, bind-test nodes are not located at the end of
>> "dm tree" output, but can be located everywwhere in the tree, so
> everywhere

will be fixed


Thanks

Patrice

>
>> bind-test output could either be:
>>
>>  simple_bus    0  [   ]   generic_simple_bus    |-- bind-test
>>  phy           0  [   ]   phy_sandbox           |   |-- bind-test-child1
>>  simple_bus    1  [   ]   generic_simple_bus    |   `-- bind-test-child2
>>
>> or:
>>
>>  simple_bus    5  [   ]   generic_simple_bus    `-- bind-test
>>  phy           2  [   ]   phy_sandbox               |-- bind-test-child1
>>  simple_bus    6  [   ]   generic_simple_bus        `-- bind-test-child2
>>
>> in_tree() function need to be updated to take care of that change.
>>
>> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
>> ---
>>
>> Changes in v2: None
>>
>>  test/py/tests/test_bind.py | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
> Reviewed-by: Simon Glass <sjg@chromium.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
