Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D01F8CA
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 May 2019 18:40:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5AD9AC05845
	for <lists+uboot-stm32@lfdr.de>; Wed, 15 May 2019 16:40:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E4AF1C05844
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2019 16:40:08 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4FGVemK018772; Wed, 15 May 2019 18:40:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=GBZPdZUk0WP9U/rOoAmNcY61SYO17uzb1tT8jhiVqyk=;
 b=oZMOczu4dUx3trI8PX/ksRXpeACQF1tW86RFjgzfqFsIC2o531aRGcwgBg6/c0pvJjEE
 JxTY1Gu/h+0Yw0OTcTPf2ipyLZ5V9+tY9PETLYRmlCJgCI7XMfn7pMvtZgQ8AGELurTx
 kCbr46G290K8XsA8rSLwew/cK2Gv9nrzvoltd1XguYJ+U/7st2ihK4/5qWaZ1L1I46Qw
 kKVjPMSZTqGJSWBlXC+e4nuIcLBEgKKCqGUvf4uVGvanp2lcyX6UQryMf9WQRJ/oUzmD
 JpUGSj/ggE2WmJoKNDlZzscGGCA62S6tMXfrqGxs3+I2ylFqa8LVkcfMuTQCpW/054e5 ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2sg0an7mfj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 15 May 2019 18:40:01 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7504931;
 Wed, 15 May 2019 16:40:00 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 59F5B2B95;
 Wed, 15 May 2019 16:40:00 +0000 (GMT)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 15 May
 2019 18:39:59 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1347.000; Wed, 15 May 2019 18:39:59 +0200
From: Patrick DELAUNAY <patrick.delaunay@st.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, "Christophe
 KERELLO" <christophe.kerello@st.com>, Patrice CHOTARD
 <patrice.chotard@st.com>, "trini@konsulko.com" <trini@konsulko.com>
Thread-Topic: [PATCH v2 3/3] arm: mach-stm32mp: Add newline to the MAC error
 message
Thread-Index: AQHVALyrmKNmkUR6q02K8tTIN5npB6ZseAEA
Date: Wed, 15 May 2019 16:39:59 +0000
Message-ID: <defd044cb5f64aae825d1fff37e0b61e@SFHDAG6NODE3.st.com>
References: <20190502075645.19901-1-manivannan.sadhasivam@linaro.org>
 <20190502075645.19901-4-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20190502075645.19901-4-manivannan.sadhasivam@linaro.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-15_11:, , signatures=0
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

Hi Manivannan,

> 
> Without newline, the error message appears for non prgrammed OTP boards
> looks messsy. Hence add it to look more clean.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


Reviewed-by: Patrick Delaunay <patrick.delaunay@st.com>

Thanks


> ---
>  arch/arm/mach-stm32mp/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c index
> 7b4431c9c75..e1a0a136809 100644
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
> --
> 2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
