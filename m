Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EBB37164D
	for <lists+uboot-stm32@lfdr.de>; Mon,  3 May 2021 15:55:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46A16C59781;
	Mon,  3 May 2021 13:55:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9431C32EA7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 May 2021 13:55:41 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143DrCEv030623; Mon, 3 May 2021 15:55:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fMpOEnTNhsxwm01GIfD2rftKuQ+4aP8OE+p/uPSgims=;
 b=4dqrRo3h/BCORzbApJEJbw3axyr7nTrdDclJSTOhhHr7B/y+3JmbxU5f9a/N+u6QMYyR
 AVA3s993iL5nxdaG6P2Z1RK86eg3B5gAuNy7WHt4lNVCbfld6GKrn+Bh6muP/lvQt+6v
 mS+raMJT0nia+AvC8gllffS4/SE881exgx1tKFrIlTF8qKfOW1T4os9zEvMF+GmHVRzv
 Ckk8Vul+hAWtKdz0l5RrxF3EWaaEho+VOdQb+Hz6833xmfQHlWnV65eC557K2jf5D0aO
 VzFFenZw+jh4cRF/UKT0dblMS0fmMPL+PwkWh9B0H5VHDI0qg7EG5zlgCzBl0H6qzFqG Fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 389s0ae19q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 15:55:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29EBB100034;
 Mon,  3 May 2021 15:55:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2064E23FE40;
 Mon,  3 May 2021 15:55:38 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 3 May
 2021 15:55:37 +0200
To: Simon Glass <sjg@chromium.org>, Patrice CHOTARD <patrice.chotard@st.com>
References: <20201028100640.13876-1-patrick.delaunay@st.com>
 <PA4PR10MB4399E6FCFA94A7F85ED8866083489@PA4PR10MB4399.EURPRD10.PROD.OUTLOOK.COM>
 <CAPnjgZ3Ys0SyPFYakq-UN31csKwz0skfGCknfm3OKg+rLqVxzA@mail.gmail.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <da632e7c-8553-e69b-ec2b-76fe5e04ce01@foss.st.com>
Date: Mon, 3 May 2021 15:55:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPnjgZ3Ys0SyPFYakq-UN31csKwz0skfGCknfm3OKg+rLqVxzA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_10:2021-05-03,
 2021-05-03 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>, Sean Anderson <seanga2@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of
	do_status
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

On 4/29/21 6:10 PM, Simon Glass wrote:
> Hi Patrick,
>
> On Tue, 20 Apr 2021 at 03:21, Patrice CHOTARD <patrice.chotard@st.com> wrote:
>> Hi Patrick
>>
>> -----Original Message-----
>> From: Uboot-stm32 <uboot-stm32-bounces@st-md-mailman.stormreply.com> On Behalf Of Patrick DELAUNAY
>> Sent: mercredi 28 octobre 2020 11:07
>> To: u-boot@lists.denx.de
>> Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>; Simon Glass <sjg@chromium.org>; Patrick DELAUNAY <patrick.delaunay@st.com>; Sean Anderson <seanga2@gmail.com>
>> Subject: [Uboot-stm32] [PATCH 1/2] cmd: pinmux: update result of do_status
>>
>> Update the result of do_status and alway returns a CMD_RET_ value (-ENOSYS was a possible result of show_pinmux).
>>
>> This patch also adds pincontrol name in error messages (dev->name) and treats correctly the status sub command when pin-controller device is not selected.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>   cmd/pinmux.c                 | 44 +++++++++++++++++++-----------------
>>   test/py/tests/test_pinmux.py |  4 ++--
>>   2 files changed, 25 insertions(+), 23 deletions(-)
>>
>> diff --git a/cmd/pinmux.c b/cmd/pinmux.c index 9942b15419..af04c95a46 100644
>> --- a/cmd/pinmux.c
>> +++ b/cmd/pinmux.c
>> @@ -41,7 +41,7 @@ static int do_dev(struct cmd_tbl *cmdtp, int flag, int argc,
>>          return CMD_RET_SUCCESS;
>>   }
>>
>> -static int show_pinmux(struct udevice *dev)
> I think it is better to return the error code and let the caller
> ignore it, If we later want to report the error code, we can.


ok even if this static is only a help of do_status I will continue to 
return the result.


>> +static void show_pinmux(struct udevice *dev)
>>   {
>>          char pin_name[PINNAME_SIZE];
>>          char pin_mux[PINMUX_SIZE];
>> @@ -51,54 +51,56 @@ static int show_pinmux(struct udevice *dev)
>>
>>          pins_count = pinctrl_get_pins_count(dev);
>>
>> -       if (pins_count == -ENOSYS) {
>> -               printf("Ops get_pins_count not supported\n");
>> -               return pins_count;
>> +       if (pins_count < 0) {
> Why change this to < 0 ?
>
> I believe that -ENOSYS is the only valid error. We should update the
> get_pins_count() API function to indicate that.

I think that any value < 0 was allowed ...

/**
* pinctrl_get_pins_count() - Display pin-controller pins number
* @dev:Pinctrl device to use
*
* This allows to know the number of pins owned by a given pin-controller
*
* Return: Number of pins if OK, or negative error code on failure
*/
intpinctrl_get_pins_count(structudevice*dev);
with
intpinctrl_get_pins_count(structudevice*dev)
{ struct pinctrl_ops *ops = pinctrl_get_ops(dev); if 
(!ops->get_pins_count) return -ENOSYS;
returnops->get_pins_count(dev);
}
But after check you are right: the ops don't allow negative value for error
/**
* @get_pins_count:Get the number of selectable pins
*
* @dev:Pinctrl device to use
*
* This function is necessary to parse the "pins" property in DTS.
*
* @Return:
* number of selectable named pins available in this driver
*/
int(*get_pins_count)(structudevice*dev);
I will update the API doc and this check.
>> +               printf("Ops get_pins_count not supported by %s\n", dev->name);
>> +               return;
>>          }
>>
>>   (...)
>>
>>   static int do_list(struct cmd_tbl *cmdtp, int flag, int argc, diff --git a/test/py/tests/test_pinmux.py b/test/py/tests/test_pinmux.py index 0cbbae000c..b3ae2ab024 100644
>> --- a/test/py/tests/test_pinmux.py
>> +++ b/test/py/tests/test_pinmux.py
>> @@ -13,9 +13,9 @@ def test_pinmux_usage_1(u_boot_console):
>>   @pytest.mark.buildconfigspec('cmd_pinmux')
>>   def test_pinmux_usage_2(u_boot_console):
>>       """Test that 'pinmux status' executed without previous "pinmux dev"
>> -    command displays pinmux usage."""
>> +    command displays error message."""
>>       output = u_boot_console.run_command('pinmux status')
>> -    assert 'Usage:' in output
>> +    assert 'pin-controller device not selected' in output
>>
>>   @pytest.mark.buildconfigspec('cmd_pinmux')
>>   @pytest.mark.boardspec('sandbox')
>>
>> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
>>
>> Thanks
>> Patrice
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
