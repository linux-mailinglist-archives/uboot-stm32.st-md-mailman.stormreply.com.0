Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59F211D0E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:33:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACD81C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:33:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22524C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:33:30 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627W1km001613; Thu, 2 Jul 2020 09:33:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=0rYx1JRgOy5Zw2oXpSIcPDT0vLGeufLWhDx4AKAXSA8=;
 b=f+qic7BE40sq3ldCGB62BZALUG7kTsIViOAhPM9F1qPeALYb5ZHZvlHCm/HJugSxCTzD
 R2lNvoyum3hPheMrIQncT/+ovo8Cnq8UQqErVsTXyPVRVBmyvS1LXuIht2/3kKXePd/h
 1u+iEiYY3xkswQ2B87uw37WCBJtt4IfBBlt9qRmVfj2D6Sz0xO9a25ZbR9ezpcy7oZvK
 II62vgeNFFZjvUrAwZ5qx7dWshsfbiqGUtkmOkKzSghgHwlUfoQqNDYTuBHAaSCIJdLa
 Aq2q1WfxHqbQSgKu4xezPpi/MQ8PX8FUu5i096AATUVSnBvhnVALEb+1IfJ1rUJ1QlC7 5g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1phbb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:33:28 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CD34100034;
 Thu,  2 Jul 2020 09:33:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2280B21E66D;
 Thu,  2 Jul 2020 09:33:28 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:33:27 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:33:27 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/4] ram: stm32mp1: protect minimum value in get_bufsize
Thread-Index: AQHWQJRe5FJkc8eZJkK4LpgaWyNhyqjz43aA
Date: Thu, 2 Jul 2020 07:33:27 +0000
Message-ID: <32e091c2-c5f7-b03d-bfbd-afe1d317f52e@st.com>
References: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
In-Reply-To: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <C544B5DFE14CF24096CCA035A72F42A7@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/4] ram: stm32mp1: protect minimum value
	in get_bufsize
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
> Add protection on minimum value for result of get_bufsize
> and check the alignment of buffer size: only multiple min_size
> is allowed; only 4 bytes alignment was checked previously
> (value & 0x3).
>
> For example the "Random" test raises an issue when size is not 8 bytes
> aligned because address for buffer = address + size / 2 is not word
> aligned.
>
> This patch avoid test error for unsupported size value.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tests.c | 37 ++++++++++++++-------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
> index bacdd74705..90e82acda7 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tests.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
> @@ -17,7 +17,7 @@
>  DECLARE_GLOBAL_DATA_PTR;
>  
>  static int get_bufsize(char *string, int argc, char *argv[], int arg_nb,
> -		       size_t *bufsize, size_t default_size)
> +		       size_t *bufsize, size_t default_size, size_t min_size)
>  {
>  	unsigned long value;
>  
> @@ -27,13 +27,14 @@ static int get_bufsize(char *string, int argc, char *argv[], int arg_nb,
>  				arg_nb, argv[arg_nb]);
>  			return -1;
>  		}
> -		if (value > STM32_DDR_SIZE || value == 0) {
> -			sprintf(string, "invalid size %s", argv[arg_nb]);
> +		if (value > STM32_DDR_SIZE || value < min_size) {
> +			sprintf(string, "invalid size %s (min=%d)",
> +				argv[arg_nb], min_size);
>  			return -1;
>  		}
> -		if (value & 0x3) {
> -			sprintf(string, "unaligned size %s",
> -				argv[arg_nb]);
> +		if (value & (min_size - 1)) {
> +			sprintf(string, "unaligned size %s (min=%d)",
> +				argv[arg_nb], min_size);
>  			return -1;
>  		}
>  		*bufsize = value;
> @@ -441,7 +442,7 @@ static enum test_result test_addressbus(struct stm32mp1_ddrctl *ctl,
>  	u32 bufsize;
>  	u32 error;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
>  		return TEST_ERROR;
>  	if (!is_power_of_2(bufsize)) {
>  		sprintf(string, "size 0x%x is not a power of 2",
> @@ -470,7 +471,7 @@ static enum test_result test_memdevice(struct stm32mp1_ddrctl *ctl,
>  	size_t bufsize;
>  	u32 error;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
>  		return TEST_ERROR;
>  	if (get_addr(string, argc, argv, 1, &addr))
>  		return TEST_ERROR;
> @@ -512,7 +513,7 @@ static enum test_result test_sso(struct stm32mp1_ddrctl *ctl,
>  	u32 error = 0;
>  	u32 data;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
>  		return TEST_ERROR;
>  	if (get_addr(string, argc, argv, 1, &addr))
>  		return TEST_ERROR;
> @@ -584,7 +585,7 @@ static enum test_result test_random(struct stm32mp1_ddrctl *ctl,
>  	u32 error = 0;
>  	unsigned int seed;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 8 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 8))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;
> @@ -744,7 +745,7 @@ static enum test_result test_noise_burst(struct stm32mp1_ddrctl *ctl,
>  	int i;
>  	enum test_result res = TEST_PASSED;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 128))
>  		return TEST_ERROR;
>  	if (get_pattern(string, argc, argv, 1, &pattern, 0xFFFFFFFF))
>  		return TEST_ERROR;
> @@ -920,7 +921,7 @@ static enum test_result test_freq_pattern(struct stm32mp1_ddrctl *ctl,
>  	const u32 **patterns;
>  	u32 bufsize;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 128))
>  		return TEST_ERROR;
>  
>  	switch (readl(&ctl->mstr) & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK) {
> @@ -1007,7 +1008,7 @@ static enum test_result test_checkboard(struct stm32mp1_ddrctl *ctl,
>  
>  	u32 checkboard[2] = {0x55555555, 0xAAAAAAAA};
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 8))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;
> @@ -1042,7 +1043,7 @@ static enum test_result test_blockseq(struct stm32mp1_ddrctl *ctl,
>  	u32 bufsize, nb_loop, loop = 0, addr, value;
>  	int i;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;
> @@ -1076,7 +1077,7 @@ static enum test_result test_walkbit0(struct stm32mp1_ddrctl *ctl,
>  	u32 bufsize, nb_loop, loop = 0, addr, value;
>  	int i;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;
> @@ -1114,7 +1115,7 @@ static enum test_result test_walkbit1(struct stm32mp1_ddrctl *ctl,
>  	u32 bufsize, nb_loop, loop = 0, addr, value;
>  	int i;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;
> @@ -1156,7 +1157,7 @@ static enum test_result test_bitspread(struct stm32mp1_ddrctl *ctl,
>  	u32 bufsize, nb_loop, loop = 0, addr, bitspread[4];
>  	int i, j;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 32))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;
> @@ -1203,7 +1204,7 @@ static enum test_result test_bitflip(struct stm32mp1_ddrctl *ctl,
>  
>  	u32 bitflip[4];
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 32))
>  		return TEST_ERROR;
>  	if (get_nb_loop(string, argc, argv, 1, &nb_loop, 1))
>  		return TEST_ERROR;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
