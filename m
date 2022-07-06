Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12279568FB1
	for <lists+uboot-stm32@lfdr.de>; Wed,  6 Jul 2022 18:52:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB27DC03FDB;
	Wed,  6 Jul 2022 16:52:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4B96C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 16:52:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 266D9iX4030886
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 6 Jul 2022 18:52:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=CSYTVW2y9rwXZLgFak2oPh0SBQ29+W4e8aEiEqnC1gE=;
 b=iN+zBiJDmgPAr6AOPouHUaPFGhTqyUgI3zKe1O+TRfzr8cQAL5kE+R8bni9xk2th4edB
 7vKrGQLA2sMmjOF6rdTLGchZq8a+WNXq17gsii8uei20EhBlKaHKxr1wvpLjtw6BsNj0
 JnpLZTXixwjV3ynmNKSSS6tX29nqtbWgRaJufIRCGsgHVTHd8LwNdWwG9abb7r1rj2x2
 K8Df/p/2AOXMaT15bj69DXRxfeTsbL6sXmc3CScuIjVp+muofFwg8Q5gtpWytXUrtG8C
 taQKrHWB755eqkMfwK63TTtMz8DVmSWdQNL/WwNBtCPgXbjAl+gVj07m3IryfAhCVkMx 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4uadetbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <uboot-stm32@st-md-mailman.stormreply.com>; Wed, 06 Jul 2022 18:52:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 650C910002A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 18:52:25 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5DB7A22788E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Jul 2022 18:52:25 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.45) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 6 Jul
 2022 18:52:18 +0200
Message-ID: <99609bfe-b8ab-1532-098d-b4f0948717b9@foss.st.com>
Date: Wed, 6 Jul 2022 18:52:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: <uboot-stm32@st-md-mailman.stormreply.com>
References: <20220630193228.1.I17bc391d4515e4ec767e7d44b04b3b81a6e242e0@changeid>
 <CAPnjgZ2yxEhHR3Fm8F87Le75R5TkWGvFvN4bxhB5WcBc1vyjzQ@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <CAPnjgZ2yxEhHR3Fm8F87Le75R5TkWGvFvN4bxhB5WcBc1vyjzQ@mail.gmail.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_09,2022-06-28_01,2022-06-22_01
Subject: Re: [Uboot-stm32] [PATCH] log: force DEBUG when LOG_DEBUG is
 activated
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi Simon

On 7/5/22 11:47, Simon Glass wrote:
> Hi Patrick,
>
> On Thu, 30 Jun 2022 at 11:33, Patrick Delaunay
> <patrick.delaunay@foss.st.com> wrote:
>> When CONFIG_LOG is activated, if LOG_DEBUG is defined in a file and
>> DEBUG is not defined the trace with debug() macro are not displayed,
>> because the parameter cond : _DEBUG = 0 is checked in debug_cond().
>>
>> With this patch the define DEBUG, used to force the trace generated by
>> debug() macro, is linked with the define LOG_DEBUG, used to force the
>> trace generated by other macros (log_debug, dev_dbg, pr_debug).
>>
>> We only need to define LOG_DEBUG in a file to activate all the
>> traces generated by any U-Boot debug macro, as it is described in
>> /doc/develop/logging.rst
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>   include/log.h | 3 +++
>>   1 file changed, 3 insertions(+)
> I think this is OK.
>
> Can you please update 'Using DEBUG' in doc/develop/logging.rst ?


yes, I prepare a V2



>
> Regards,
> Simon
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32

Regards

Patrick


_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
