Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AD22437FC
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:52:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E415DC36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:52:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D73FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:52:14 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9q1PN005651; Thu, 13 Aug 2020 11:52:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3Kg/dhnv2Y6U0rSx/+ZeREpM+d3XlafJXzpASGbfpM4=;
 b=IzhdQynMn5cNALwvT91zkqWgf8qtDVPQb4f3JevpJhPUZmdGIy014iQi2ap+YEztQDsq
 Jzov8w0dm1leziTtJOti8zlxSEg1JfRYDpGG494gprKUMT8BRpf1MveCOpPtAFm1pToc
 Ja+siB9L+DSr9RkxtgyUhEJQU8//I4T4fYYH9RLYhYSHUMm3Bbug0COeLx7z6279Pxko
 GIUoQ7gRk9QCw2CXSyebjMnDpYTp6Z6BztWcaxxn5cUgFH2QCbm9oPoS5p/9luGQ7OZc
 vNf3pn6g1LRhjTKJ3z5FfL8PxQcIU1JSSMZlTVvgFUUgZ730mbBKpH0kXqhQ+B6KgMSf Gg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm9rny48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:52:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 47EE710002A;
 Thu, 13 Aug 2020 11:52:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3FA532A5FD2;
 Thu, 13 Aug 2020 11:52:13 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:52:12 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:52:12 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 07/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_late_init
Thread-Index: AQHWcUK7Q0vKEiN9bE2A3RXfzUf9Tak1qsgA
Date: Thu, 13 Aug 2020 09:52:12 +0000
Message-ID: <c267f6ef-1409-00e3-ef9b-9934b022f88e@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-7-patrick.delaunay@st.com>
 <d0a41bcb-56f1-3636-b3a2-26353e6a0f77@st.com>
In-Reply-To: <d0a41bcb-56f1-3636-b3a2-26353e6a0f77@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <D6F67E1E5635804C9AF47D460E1C07B7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 07/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in board_late_init
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


On 8/13/20 9:24 AM, Patrice CHOTARD wrote:
> Hi Patrick
>
> On 7/31/20 4:31 PM, Patrick Delaunay wrote:
>> Use IS_ENABLED to prevent ifdef in board_late_init.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> ---
>>
>>  board/st/stm32mp1/stm32mp1.c | 60 ++++++++++++++++++------------------
>>  1 file changed, 30 insertions(+), 30 deletions(-)

Applied on u-boot-stm/master

Thanks

>>
>> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
>> index 985233f2b3..a9705baa24 100644
>> --- a/board/st/stm32mp1/stm32mp1.c
>> +++ b/board/st/stm32mp1/stm32mp1.c
>> @@ -654,47 +654,47 @@ int board_init(void)
>>  
>>  int board_late_init(void)
>>  {
>> -#ifdef CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG
>>  	const void *fdt_compat;
>>  	int fdt_compat_len;
>>  	int ret;
>>  	u32 otp;
>>  	struct udevice *dev;
>>  	char buf[10];
>> +	char dtb_name[256];
>> +	int buf_len;
>> +
>> +	if (IS_ENABLED(CONFIG_ENV_VARS_UBOOT_RUNTIME_CONFIG)) {
>> +		fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
>> +					 &fdt_compat_len);
>> +		if (fdt_compat && fdt_compat_len) {
>> +			if (strncmp(fdt_compat, "st,", 3) != 0) {
>> +				env_set("board_name", fdt_compat);
>> +			} else {
>> +				env_set("board_name", fdt_compat + 3);
>>  
>> -	fdt_compat = fdt_getprop(gd->fdt_blob, 0, "compatible",
>> -				 &fdt_compat_len);
>> -	if (fdt_compat && fdt_compat_len) {
>> -		if (strncmp(fdt_compat, "st,", 3) != 0) {
>> -			env_set("board_name", fdt_compat);
>> -		} else {
>> -			char dtb_name[256];
>> -			int buf_len = sizeof(dtb_name);
>> +				buf_len = sizeof(dtb_name);
>> +				strncpy(dtb_name, fdt_compat + 3, buf_len);
>> +				buf_len -= strlen(fdt_compat + 3);
>> +				strncat(dtb_name, ".dtb", buf_len);
>> +				env_set("fdtfile", dtb_name);
>> +			}
>> +		}
>> +		ret = uclass_get_device_by_driver(UCLASS_MISC,
>> +						  DM_GET_DRIVER(stm32mp_bsec),
>> +						  &dev);
>>  
>> -			env_set("board_name", fdt_compat + 3);
>> +		if (!ret)
>> +			ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
>> +					&otp, sizeof(otp));
>> +		if (ret > 0 && otp) {
>> +			snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
>> +			env_set("board_id", buf);
>>  
>> -			strncpy(dtb_name, fdt_compat + 3, buf_len);
>> -			buf_len -= strlen(fdt_compat + 3);
>> -			strncat(dtb_name, ".dtb", buf_len);
>> -			env_set("fdtfile", dtb_name);
>> +			snprintf(buf, sizeof(buf), "0x%04x",
>> +				 ((otp >> 8) & 0xF) - 1 + 0xA);
>> +			env_set("board_rev", buf);
>>  		}
>>  	}
>> -	ret = uclass_get_device_by_driver(UCLASS_MISC,
>> -					  DM_GET_DRIVER(stm32mp_bsec),
>> -					  &dev);
>> -
>> -	if (!ret)
>> -		ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_BOARD),
>> -				&otp, sizeof(otp));
>> -	if (ret > 0 && otp) {
>> -		snprintf(buf, sizeof(buf), "0x%04x", otp >> 16);
>> -		env_set("board_id", buf);
>> -
>> -		snprintf(buf, sizeof(buf), "0x%04x",
>> -			 ((otp >> 8) & 0xF) - 1 + 0xA);
>> -		env_set("board_rev", buf);
>> -	}
>> -#endif
>>  
>>  	/* for DK1/DK2 boards */
>>  	board_check_usb_power();
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>
> Thanks
>
> Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
