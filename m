Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2906C211D21
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:38:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE6D1C36B25
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:38:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0171C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:38:05 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627W0ti001577; Thu, 2 Jul 2020 09:38:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=UJws+sTngMh0+lDu6FbEBKXyRAYryXhl57upSD/pVBc=;
 b=bD5FlqYCX1wdT7Q5AZxsfgO1KtolN8EF6Sga1yWrNyMrihHRdzPs2AL/lu3WbYYvPsdD
 qnfUXJaBJjLJJtzJXNITyVgwxsWe3aX+SaOO3M84BGhCEEhD4yMF7S4gwk+2BYO7ojAz
 GX4Rai9hGcp8Sk3gSakiSIbev5OJSFwYViGUYtwOJp9AMuCyVAYrAlXZ9JJ85Kb4f9Wz
 pF5gGeUaRIy3xPZh/spfaOAtJoCaqMti6IquhTXxIDTnqzT4/HR1vXvCvMJ/vyY2Scqc
 w4fjd7tfHP70kcGj4Gt6Sai3ayQr0g6SWX0dGC+/IhZJPPEyHWbR4N7/qOt4djF3QXM1 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuk1pj56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:38:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6166A100038;
 Thu,  2 Jul 2020 09:38:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 43EF321E679;
 Thu,  2 Jul 2020 09:38:04 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 Jul
 2020 09:38:03 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:38:03 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 3/4] ram: stm32mp1: use the DDR size by default in the
 test addressBus
Thread-Index: AQHWQJRfQxu3pDpjV0ieW7jdTdwcLqjz5L+A
Date: Thu, 2 Jul 2020 07:38:03 +0000
Message-ID: <3eb664fa-5155-2503-270b-b84956882f3f@st.com>
References: <20200612103440.1.I29f1f31d4312a6029cc38e3f4fe9aa0baedece7d@changeid>
 <20200612083504.20746-1-patrick.delaunay@st.com>
In-Reply-To: <20200612083504.20746-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <464EDA6B0A98F44A97356E6AE1FB6BA8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 3/4] ram: stm32mp1: use the DDR size by
 default in the test addressBus
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

one typo below

On 6/12/20 10:34 AM, Patrick Delaunay wrote:
> The test 4 = "AddressBus [size] [addr]" without parameter
> detects alias for any address bit only when:
> - size = real size of DDR
> - addr = start of DDR = 0xC0000000
>
> These value must by the default value when parameters are absent.
s/by the /be the
>
> This patch sets bufsize to STM32_DDR_SIZE and get_bufsize() selects
> the correct value for bufsize when this parameter is absent =
> full size of the DDDR
>
> On EV1 board :
> DDR> test 4
> running at 0xC0000000 length 0x40000000
>
> On DK2 board
> DDR> test 4
> running at 0xC0000000 length 0x20000000
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tests.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tests.c b/drivers/ram/stm32mp1/stm32mp1_tests.c
> index fec9fd010e..a2a69da9a3 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tests.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tests.c
> @@ -442,7 +442,7 @@ static enum test_result test_addressbus(struct stm32mp1_ddrctl *ctl,
>  	u32 bufsize;
>  	u32 error;
>  
> -	if (get_bufsize(string, argc, argv, 0, &bufsize, 4 * 1024, 4))
> +	if (get_bufsize(string, argc, argv, 0, &bufsize, STM32_DDR_SIZE, 4))
>  		return TEST_ERROR;
>  	if (!is_power_of_2(bufsize)) {
>  		sprintf(string, "size 0x%x is not a power of 2",
> @@ -452,6 +452,7 @@ static enum test_result test_addressbus(struct stm32mp1_ddrctl *ctl,
>  	if (get_addr(string, argc, argv, 1, &addr))
>  		return TEST_ERROR;
>  
> +	printf("running at 0x%08x length 0x%x\n", addr, bufsize);
>  	error = (u32)addressbus((u32 *)addr, bufsize);
>  	if (error) {
>  		sprintf(string, "0x%x: error for address 0x%x",

You can add my reviewed-by when typo will be fixed

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
