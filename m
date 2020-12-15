Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 814102DAFE6
	for <lists+uboot-stm32@lfdr.de>; Tue, 15 Dec 2020 16:19:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42D24C3087A;
	Tue, 15 Dec 2020 15:19:19 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 577E1C36B36
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Dec 2020 15:19:17 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BFFBkVK017426; Tue, 15 Dec 2020 16:19:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to :
 references : from : cc : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JYAiokmqm9s4Rg/kKemfSDjb6SDMq5nW2CuOv3d6ICU=;
 b=Uoz5anfVXdAJ5CUrD3OFDXnlJccG43dflwfW/qUKBgoaIGalNPvK9kMQshMeDYb1+XUJ
 bUOIGSdL0Cx1zHjBbG67Bq+qKkyWb8AEOXDK4F7k9V7qfS4L+JTenM9SUnYWjMSYjxJ6
 SEVAK3nLmpW7RXLVtCyXgl95os5J9iEE/SshrCjGSX+4uB5SIz7aCpMUdZdbnYNaU6XT
 zaZf5vmwGM6X3opAo75ZtkVZRZ3o+lV5+xEOcnTfifLeSDDyqQZ/ADYVFFjIktyyCovF
 vxkULsWoJqfmbEWouu8+SyeT/xlG3ELaBF4iUN52jrzpY1g46H5tdyyyqanIKG7E9v5p eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt97exh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Dec 2020 16:19:12 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2ABCF10002A;
 Tue, 15 Dec 2020 16:19:11 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1BD4621E666;
 Tue, 15 Dec 2020 16:19:11 +0100 (CET)
Received: from lmecxl0994.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 15 Dec
 2020 16:19:10 +0100
To: <uboot-stm32@st-md-mailman.stormreply.com>, Simon Glass <sjg@chromium.org>
References: <20201203092032.8124-1-patrick.delaunay@st.com>
 <20201203102027.4.I810a6b37da2c8aa13ca2e20408a8d54b08e2ef32@changeid>
 <CAPnjgZ3ZK8yEYe5+ijTNNX3miwfZ2uex3Ro1WX=XzoSoBWg_HA@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <56c99c33-36db-cddc-9c1f-2133ba3921fe@foss.st.com>
Date: Tue, 15 Dec 2020 16:19:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3ZK8yEYe5+ijTNNX3miwfZ2uex3Ro1WX=XzoSoBWg_HA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-15_12:2020-12-15,
 2020-12-15 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Anatolij Gustschin <agust@denx.de>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 4/4] console: add console_tstc_check
 helper function for CONSOLE_MUX
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

Hi Simon,

On 12/12/20 4:39 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Thu, 3 Dec 2020 at 02:20, Patrick Delaunay <patrick.delaunay@st.com> wrote:
>> Add the helper function console_tstc_check() and replace the test
>> #if CONFIG_IS_ENABLED(CONSOLE_MUX) to a simple if to respect the
>> U-Boot coding rule.
>>
>> No functional change.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>   common/console.c | 36 ++++++++++++++++++++++++------------
>>   1 file changed, 24 insertions(+), 12 deletions(-)
>>
>> diff --git a/common/console.c b/common/console.c
>> index 0b864444bb..c570cd88cf 100644
>> --- a/common/console.c
>> +++ b/common/console.c
>> @@ -248,6 +248,12 @@ static int console_getc(int file)
>>          return ret;
>>   }
>>
>> +/*  Upper layer may have already called tstc(): check the saved result */
>> +static bool console_tstc_check(void)
> This is checking if we actually have a device, right? I think
> has_tstcdev() would be better.

the variable tstcdev save the last stio device with indicated a pending 
character

(last stdio dev wich has result of tstc() != 0)

- in function console_tstc() called by tstc() API -

This device will be used for the next getc() request (then it reset also 
the tstcdev value).

So it is a "tstc" device but used "getc".

But OK to rename it to "console_has_tstcdev()" because for me

it is only a first cleanup step (see after).

>
> Also could you add a comment in the testcdev variable declaration as
> to what this variable actually is for?
>
OK


For information, I prepared a other patch, to be apply after this serie, 
to simply the fgetc() implementation

and have a common behavior with or without CONFIG_CONSOLE_MUX

This function "console_tstc_check()" will disappear, integrated in console_tstc(),
and the final result is more simple

int fgetc(int file)
{
	if (file < MAX_FILES) {
		/*
		 * Effectively poll for input wherever it may be available.
		 */
		for (;;) {
			WATCHDOG_RESET();
			if (console_tstc(file))
				return console_getc(file);
			/*
			 * If the watchdog must be rate-limited then it should
			 * already be handled in board-specific code.
			 */
			if (IS_ENABLED(CONFIG_WATCHDOG))
				udelay(1);
		}
	}
	return -1;
}

>> +{
>> +       return !!tstcdev;
>> +}
>> +
>>   static int console_tstc(int file)
>>   {
>>          int i, ret;
>> @@ -340,6 +346,11 @@ static inline int console_getc(int file)
>>          return stdio_devices[file]->getc(stdio_devices[file]);
>>   }
>>
>> +static bool console_tstc_check(void)
>> +{
>> +       return false;
>> +}
>> +
>> (...)


Regards

Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
