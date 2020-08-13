Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE2F2434E6
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:23:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BAC4C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:23:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B72E4C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:23:38 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D7Djhs003962; Thu, 13 Aug 2020 09:23:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=E+QOYxYSkOUbubfWB9DmUM77zIVwKMuj+XQOvtot1Ms=;
 b=mHsPbaMyBnqVr56iuuG1po4GHJxZ9sBE221iWQ3NebfgQT/SvHD5N1ZmL+uLhY1QRVKX
 cjd8TVxLebBom2OV07spZt0Ut07qugY3X1tKF2zD9CPJ+xgxU5vg/YCO3HGO7ulNm4zx
 OM326Kq57b1W+T/9cLwTrEWtrIrmFmpieOvpNeYamxzxuVhwTo1kePAt/UJKiYAtezzm
 WZFdV4O6ziArgr1G4bs92ewNmv3Jgl8oawxbbBRdVABTVEnKpJGBc88434ziy6njiKhH
 n3TiJodlGWmjeqv/EjIKWmiMB7ajkhZe3O9KxEDkhntjyM7jFyRzGw1WZHClp+FmMKke HA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm6fmfq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:23:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 921AE10002A;
 Thu, 13 Aug 2020 09:23:37 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 890D421F675;
 Thu, 13 Aug 2020 09:23:37 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:23:37 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:23:37 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [Uboot-stm32] [PATCH 06/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in dk2_i2c1_fix
Thread-Index: AQHWcUKomBdSaNLGvk6iy1xz0rQydw==
Date: Thu, 13 Aug 2020 07:23:36 +0000
Message-ID: <3e3ad0ee-cf2d-f5c0-9b2e-6419d0248078@st.com>
References: <20200731143152.8812-1-patrick.delaunay@st.com>
 <20200731143152.8812-6-patrick.delaunay@st.com>
In-Reply-To: <20200731143152.8812-6-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <6F2EE59DE12B8E4A81835063B854D7A3@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 06/11] board: stm32mp1: use IS_ENABLED to
 prevent ifdef in dk2_i2c1_fix
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

On 7/31/20 4:31 PM, Patrick Delaunay wrote:
> Use IS_ENABLED to prevent ifdef in dk2_i2c1_fix.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  board/st/stm32mp1/stm32mp1.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index a0a2f9978f..985233f2b3 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -521,7 +521,6 @@ static void sysconf_init(void)
>  	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
>  }
>  
> -#ifdef CONFIG_DM_REGULATOR
>  /* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
>  static int dk2_i2c1_fix(void)
>  {
> @@ -529,6 +528,9 @@ static int dk2_i2c1_fix(void)
>  	struct gpio_desc hdmi, audio;
>  	int ret = 0;
>  
> +	if (!IS_ENABLED(CONFIG_DM_REGULATOR))
> +		return -ENODEV;
> +
>  	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
>  	if (!ofnode_valid(node)) {
>  		pr_debug("%s: no hdmi-transmitter@39 ?\n", __func__);
> @@ -586,7 +588,6 @@ static bool board_is_dk2(void)
>  
>  	return false;
>  }
> -#endif
>  
>  static bool board_is_ev1(void)
>  {
> @@ -634,12 +635,11 @@ int board_init(void)
>  	if (board_is_ev1())
>  		board_ev1_init();
>  
> -#ifdef CONFIG_DM_REGULATOR
>  	if (board_is_dk2())
>  		dk2_i2c1_fix();
>  
> -	regulators_enable_boot_on(_DEBUG);
> -#endif
> +	if (IS_ENABLED(CONFIG_DM_REGULATOR))
> +		regulators_enable_boot_on(_DEBUG);
>  
>  	if (!IS_ENABLED(CONFIG_TFABOOT))
>  		sysconf_init();

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
