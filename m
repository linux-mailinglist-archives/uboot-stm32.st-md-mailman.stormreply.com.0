Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016D211C97
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 09:23:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDF64C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 07:23:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3E07C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 07:23:07 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0627IwOR005747; Thu, 2 Jul 2020 09:22:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=d0xOpfHs9vl1gtAphtQtHx2pRjfH8uo9UqL73GNOaJI=;
 b=fCcHHunK7wxpBXkl31leXNpylzFBV3ecb1UY7QlNis16qzawcKGGt678dn/t3/aYhgX/
 xPo+jjaxitbAdYcKtUj2wOHWs4BeHXiK/KDYDvRyVKFq8GTFSpUUJ1N1cSLqyfADgY0m
 f2tbhrUX9HL6qy+WKUd5Ns52NW7zfOB91nn+dx8QnNSqnbh6DRj02RoKFPrSJF+dZp1r
 lDt/TPg+HhswKNDw1TXcmh8NhugcrL5dgB85LRZatgvsrDu5/JwynDDd/6FnNdJV1hQN
 uBW/Oq9I9FYbPNpiGvBI69HJjxRZmOLJ+BrAh7Zb0RFfG17/YdzOEngpN7YP9xxlfT+A Nw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wuvwee95-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 09:22:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A093010002A;
 Thu,  2 Jul 2020 09:22:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E53221CA8D;
 Thu,  2 Jul 2020 09:22:01 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 2 Jul
 2020 09:22:01 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 2 Jul 2020 09:22:01 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 1/2] cmd: env: use ENV_IS_IN_DEVICE in env info
Thread-Index: AQHWQvwfCusYS/1AxEmI0c0pzjMhcKjz23QA
Date: Thu, 2 Jul 2020 07:22:01 +0000
Message-ID: <ec35c033-ea42-c1c0-7822-505bbe2f36a8@st.com>
References: <20200615100246.19616-1-patrick.delaunay@st.com>
In-Reply-To: <20200615100246.19616-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <B45E67226D52494CA4F567FA2F9BB9E4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_03:2020-07-01,
 2020-07-02 signatures=0
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Leo Ruan <tingquan.ruan@cn.bosch.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>, Simon Glass <sjg@chromium.org>,
 Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] cmd: env: use ENV_IS_IN_DEVICE in env
	info
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

On 6/15/20 12:02 PM, Patrick Delaunay wrote:
> Use the define ENV_IS_IN_DEVICE to test if one the
> CONFIG_ENV_IS_IN_...  is defined and correct the detection of
> persistent storage support in the command "env info"
> if CONFIG_ENV_IS_NOWHERE is activated.
>
> Since commit 60d5ed2593c9 ("env: allow ENV_IS_NOWHERE with
> other storage target") test CONFIG_ENV_IS_NOWHERE is not
> enough; see also commit 953db29a1e9c6 ("env: enable saveenv
> command when one CONFIG_ENV_IS_IN is activated").
>
> This patch avoids issue for this command in stm32mp1 platform.
>
> Previously sent in serie
> cmd: env: add option for quiet output on env info
> http://patchwork.ozlabs.org/project/uboot/list/?series=158105
>
> Resend as separate serie.
>
> END
Remove END
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> ---
>
>  cmd/nvedit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/cmd/nvedit.c b/cmd/nvedit.c
> index 08d49df220..49338b4d36 100644
> --- a/cmd/nvedit.c
> +++ b/cmd/nvedit.c
> @@ -1265,7 +1265,7 @@ static int do_env_info(struct cmd_tbl *cmdtp, int flag,
>  
>  	/* evaluate whether environment can be persisted */
>  	if (eval_flags & ENV_INFO_IS_PERSISTED) {
> -#if defined(CONFIG_CMD_SAVEENV) && !defined(CONFIG_ENV_IS_NOWHERE)
> +#if defined(CONFIG_CMD_SAVEENV) && defined(ENV_IS_IN_DEVICE)
>  		printf("Environment can be persisted\n");
>  		eval_results |= ENV_INFO_IS_PERSISTED;
>  #else

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
