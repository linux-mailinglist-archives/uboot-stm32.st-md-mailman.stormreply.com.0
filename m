Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9E45A632D
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Aug 2022 14:21:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 150F9C03FD4;
	Tue, 30 Aug 2022 12:21:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1660AC57B6C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Aug 2022 12:21:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U9S6V7029929;
 Tue, 30 Aug 2022 14:21:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6+ePgRCxTRN9rb5icTSBP1sxumDdA0ND2JbUzWWLKJg=;
 b=c/4X7/2yyW+Jl+I7xziuUH9nTnCFSSKck8OeBQMq3591ehjuGxAQQqHhUu7bnpkSgHhL
 Ejvm1OFgSADSNPskdYORDjt4QgOa8JmgUDCNDBbTSo4mz0WMGbdSt+Fi7Woc0ia3J5ra
 rENog/bUkl6RFZrqkSYiQDSVBbLDGmYIWFMZZjC9hCz/3di7w2b/OVsecd5vrT6RQLio
 QeBWlAk4M6DBbXLeKagZlqr5bgU72E0BNQej95UtLgBrISjAyLIOxfIM6qUzlbcORDnX
 WXwzBSQ3G+0yEViBxtTwPihCFRpxYSrPRbFUhua5vwV8Wb5vD/3e/GwblX/e9WSJ8k3V ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j7am0ymnt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Aug 2022 14:21:37 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A268110002A;
 Tue, 30 Aug 2022 14:21:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B388226FD2;
 Tue, 30 Aug 2022 14:21:36 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.121) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:21:35 +0200
Message-ID: <462adc83-d755-e2a7-8724-1dcf2a867339@foss.st.com>
Date: Tue, 30 Aug 2022 14:21:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220830120914.2329522-1-patrice.chotard@foss.st.com>
 <20220830120914.2329522-4-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220830120914.2329522-4-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH v3 3/4] pinctrl: pinctrl_stm32: Populate
 uc_priv->name[] with pinmux node's name
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

Hi,

On 8/30/22 14:09, Patrice Chotard wrote:
> Populate uc_priv->name[] with pinmux node's name in order to indicate
> the pinmuxing's name in case GPIO is configured in alternate.
>
> For example, for STM32 SoC's based platform, "gpio status" command
> output :
>
>    before
>      Bank GPIOZ:
>        GPIOZ0: unused : 0 [ ]
>        GPIOZ1: unused : 0 [ ]
>        GPIOZ2: unused : 0 [ ]
>        GPIOZ3: unused : 0 [ ]
>        GPIOZ4: func
>        GPIOZ5: func
>        GPIOZ6: unused : 0 [ ]
>        GPIOZ7: unused : 0 [ ]
>        GPIOZ8: unknown
>        GPIOZ9: unknown
>        GPIOZ10: unknown
>        GPIOZ11: unknown
>        GPIOZ12: unknown
>        GPIOZ13: unknown
>        GPIOZ14: unknown
>        GPIOZ15: unknown
>
>    After
>      Bank GPIOZ:
>        GPIOZ0: unused : 0 [ ]
>        GPIOZ1: unused : 0 [ ]
>        GPIOZ2: unused : 0 [ ]
>        GPIOZ3: unused : 0 [ ]
>        GPIOZ4: func i2c4-0
>        GPIOZ5: func i2c4-0
>        GPIOZ6: unused : 0 [ ]
>        GPIOZ7: unused : 0 [ ]
>        GPIOZ8: unknown
>        GPIOZ9: unknown
>        GPIOZ10: unknown
>        GPIOZ11: unknown
>        GPIOZ12: unknown
>        GPIOZ13: unknown
>        GPIOZ14: unknown
>        GPIOZ15: unknown
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   drivers/pinctrl/pinctrl_stm32.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick




_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
