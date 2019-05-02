Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BB5115F1
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 11:04:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E530C07305
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 May 2019 09:04:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68C26C07303
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 May 2019 09:04:37 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x428ubQD012505; Thu, 2 May 2019 11:04:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=JKSKbmmy3SFvmIsbZlPBLDs1qzf8xlIqQfloUwa/yBA=;
 b=1H9m8OtFXr8MgD+K71KGMt0TF+cyv0yaqZPM+7TsepBIvNjQ4KV17mPsWaHr4Wbhs3Tt
 /u/CMXV9OnF4DUbUXMNlryiKkN/EtzxkAIUOauehf/Suo2gUzdZkfXU35MeAXR3P1FHj
 DSjTkC3I0jt3SzQc0wjHuqekoRTnSOLUN7uW1pJT0+V7BAOQdUBT+ODvRMlgntF8P7KF
 AGkq7Y7QpjTmbXzlnA++irUKNM3npW3oxzrHYHf4+S+GvIN3K7dEeE7KvggAQ8jPFryn
 yWWdM9RtsHM3qcwMcYNqOk2jfyldkKf0QCoWtaasme54QpL98AZ6VyLxFu9U/0hdQvrK Pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s6xgcqe0c-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 02 May 2019 11:04:33 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2FAD334;
 Thu,  2 May 2019 09:04:33 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0747A14EF;
 Thu,  2 May 2019 09:04:33 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 2 May
 2019 11:04:32 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Thu, 2 May 2019 11:04:32 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Patrick DELAUNAY
 <patrick.delaunay@st.com>, Christophe KERELLO <christophe.kerello@st.com>,
 "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [PATCH v2 3/3] arm: mach-stm32mp: Add newline to the MAC error
 message
Thread-Index: AQHVALyqHvwkWWtjrEesVihSBfYSy6ZXaRqA
Date: Thu, 2 May 2019 09:04:32 +0000
Message-ID: <74b83799-c99b-3f96-197d-0f940b0d0577@st.com>
References: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
 <20190502075645.19901-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190502075645.19901-4-manivannan.sadhasivam@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <5C8659BA2B13FD42A5F27E418F3036F1@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_04:, , signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] arm: mach-stm32mp: Add newline to
 the MAC error message
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



On 5/2/19 9:56 AM, Manivannan Sadhasivam wrote:
> Without newline, the error message appears for non prgrammed OTP boards
> looks messsy. Hence add it to look more clean.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/mach-stm32mp/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 7b4431c9c75..e1a0a136809 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -481,7 +481,7 @@ static int setup_mac_address(void)
>  		enetaddr[i] = ((uint8_t *)&otp)[i];
>  
>  	if (!is_valid_ethaddr(enetaddr)) {
> -		pr_err("invalid MAC address in OTP %pM", enetaddr);
> +		pr_err("invalid MAC address in OTP %pM\n", enetaddr);
>  		return -EINVAL;
>  	}
>  	pr_debug("OTP MAC address = %pM\n", enetaddr);
> 


Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
