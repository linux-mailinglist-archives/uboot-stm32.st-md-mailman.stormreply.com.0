Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68702211D13
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:35:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32CF6C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:35:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F19C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:35:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627W0sk001577; Thu, 2 Jul 2020 09:35:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+VJNeyUfhfbW+eOMBu/R+fsZp2LQy8ZY/23qKzP6Ess=;
 b=TNiwxAhR6WAlhu7ou5eScsB6jqUCas/+jy6anRa63x87WMLibNF0161HK1BpZg+LJZM7
 CaFkddWHNg0edlCvwsEDF6JJKL5hnDdBrAMbVrujii+/LnA3AI2sR6HvQS1M7lFkYmJ1
 sam63wbzwQmB/43X0ik+ZwzNmppSRJayNljftAoocISGBGrrcAi1vFJtYR3NnpL+LBF2
 Q+67K0Q/seHcJQ/OhREt1q00WLgRqmhKXUBsLTd/Zno2TIQz5exg6I1MwAa+yhcqqvE8
 TA2KcX+h+NfjIBmGT8G/B/VWvHVuuFzbU+e+Osx/oLNQ/sMS/ZkOJ2OECEdC4IzKnGyt dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1php4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:35:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 517A310002A;
 Thu,  2 Jul 2020 09:35:27 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47D2C21E675;
 Thu,  2 Jul 2020 09:35:27 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:35:26 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:35:26 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 2/4] ram: stm32mp1: add parameter addr in test
 FrequencySelectivePattern
Thread-Index: AQHWQJReshyHp7XJuE+3fwXV+jrH6ajz5AQA
Date: Thu, 2 Jul 2020 07:35:26 +0000
Message-ID: <989531a5-3430-5826-d319-a2059e0570bf@st.com>
References: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
 <20200612103440.2.I3487912650c4bf7acb85b595e2865036cd0a953c@changeid>
In-Reply-To: <20200612103440.2.I3487912650c4bf7acb85b595e2865036cd0a953c@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <FE3E03AEAA507A44AEAB35DD0A0596C2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/4] ram: stm32mp1: add parameter addr in
 test FrequencySelectivePattern
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

Hi Patrick

On 6/12/20 10:34 AM, Patrick Delaunay wrote:
> Add a parameter addr in test FrequencySelectivePattern to select
> the base address used to execute the tests.
>
> Default value (when the parameter is absent) is STM32_DDR_BASE,
> selected in get_addr() function.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tests.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
> index 90e82acda7..fec9fd010e 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tests.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
> @@ -919,10 +919,12 @@ static enum test_result test_freq_pattern(struct stm32mp1_ddrctl *ctl,
>  	enum test_result res = TEST_PASSED, pattern_res;
>  	int i, bus_width;
>  	const u32 **patterns;
> -	u32 bufsize;
> +	u32 bufsize, addr;
>  
>  	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 128))
>  		return TEST_ERROR;
> +	if (get_addr(string, argc, argv, 1, &addr))
> +		return TEST_ERROR;
>  
>  	switch (readl(&ctl->mstr) & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK) {
>  	case DDRCTRL_MSTR_DATA_BUS_WIDTH_HALF:
> @@ -935,15 +937,14 @@ static enum test_result test_freq_pattern(struct stm32mp1_ddrctl *ctl,
>  	}
>  
>  	printf("running test pattern at 0x%08x length 0x%x width = %d\n",
> -	       STM32_DDR_BASE, bufsize, bus_width);
> +	       addr, bufsize, bus_width);
>  
>  	patterns =
>  		(const u32 **)(bus_width == 16 ? patterns_x16 : patterns_x32);
>  
>  	for (i = 0; i < NB_PATTERN; i++) {
>  		printf("test data pattern %s:", patterns_comments[i]);
> -		pattern_res = test_loop(patterns[i], (u32 *)STM32_DDR_BASE,
> -					bufsize);
> +		pattern_res = test_loop(patterns[i], (u32 *)addr, bufsize);
>  		if (pattern_res != TEST_PASSED)	{
>  			printf("Failed\n");
>  			return pattern_res;
> @@ -1419,9 +1420,9 @@ const struct test_desc test[] = {
>  	 "Verifies r/w and memcopy(burst for pseudo random value.",
>  	 3
>  	},
> -	{test_freq_pattern, "FrequencySelectivePattern", "[size]",
> +	{test_freq_pattern, "FrequencySelectivePattern", "[size] [addr]",
>  	 "write & test patterns: Mostly Zero, Mostly One and F/n",
> -	 1
> +	 2
>  	},
>  	{test_blockseq, "BlockSequential", "[size] [loop] [addr]",
>  	 "test incremental pattern",

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
