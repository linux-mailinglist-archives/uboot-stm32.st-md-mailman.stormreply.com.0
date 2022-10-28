Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426F61127B
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Oct 2022 15:15:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3C09C04003;
	Fri, 28 Oct 2022 13:15:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40384C640F5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 09:11:34 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso3199473wmq.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Oct 2022 02:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=c8RygNvdLbGaRs5N2+ccRqXo+PSVJ6LcIlNJlMOHboc=;
 b=eQcO+RbkrthKSbGtbT+ibZgkfhsBoVUTPAUYjpiiAAyh3iC6RwoYSPCkz5Md99FvdO
 TNJabedYn85w1pA72AzV3FUlfu368W04Hlh+DcjuNRGO5mvt5HNkQ743aTYAzQpdnhLp
 119dEHjEYn1+JiI37Gw78jcEKrzMNqGdhIHjvGZfT3de8avGRG3NApF8sB4/GY40tRx9
 MfQbCXrtdI92cU0h4OwBOt4w5jxYpM6MHhp8avRUB3YM/U+fe/IJZKz5U3LwSZifqb99
 5mdmJVApZLY60HzjPD/WDzpd/1d/XHRvlFb0Vmdmly+PeSPWoww3AWiloFzLwKRCPzyQ
 VDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:reply-to
 :references:cc:to:content-language:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8RygNvdLbGaRs5N2+ccRqXo+PSVJ6LcIlNJlMOHboc=;
 b=iDLUEHvwvCFGLr/xIdK/llaMUDpwHCkliSUWFNuYrfaSwZ5pBcYb1J0M3HP0bAMkge
 vokfxESpyJ16tqAMp/KH2ed2tLvpMQqbE2ZKvoP2pMwNL1BzB5x3SwWhjZemMTOByPek
 JwHmhZJtclZEmjlYTQNupAxY686QTPE3/KF9CVRDCWl1Z9bTotoNp7WNHuOWyPpkeAFX
 w11Fu7nH14A1DnOdh9JZ7rbx9IasvpoOa27z4GUc0CzLqItO+yDDHm7XOiQpXe+F4aR3
 LSyLKNols1e9nlqbdEWd9S1wgX8mtRd7ddEO1omOLsi1MPX4vvps5hv9ZEltRrZ0db3T
 MQYQ==
X-Gm-Message-State: ACrzQf01jrS70EKDEaiV39rvm0L988rU2H9FecxVRj4cZfIQ75QGteGC
 kPpwF+H+TTcOyiZfTBHExNnJ4w==
X-Google-Smtp-Source: AMsMyM6xUMxZvlX0L/yLhPdtI99xehacySq+dFMD2KBUSZC1/0Ea1/8x9H1qodIN4Oc3J771zu3cIw==
X-Received: by 2002:a05:6000:154e:b0:236:8ead:3eb4 with SMTP id
 14-20020a056000154e00b002368ead3eb4mr7441517wry.71.1666948293789; 
 Fri, 28 Oct 2022 02:11:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:9e9c:c6c2:95a3:c182?
 ([2a01:e0a:898:f380:9e9c:c6c2:95a3:c182])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adfd090000000b0022ae401e9e0sm3061567wrh.78.2022.10.28.02.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 02:11:33 -0700 (PDT)
Message-ID: <fcbb9e9e-a458-6958-85e6-2d6ba9feafba@linaro.org>
Date: Fri, 28 Oct 2022 11:11:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20221028090120.1536827-1-patrick.delaunay@foss.st.com>
 <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221028110055.3.I4bb4d81ec61fcc6340db1f81d5504905a22e90af@changeid>
X-Mailman-Approved-At: Fri, 28 Oct 2022 13:15:02 +0000
Cc: Peter Hoyes <Peter.Hoyes@arm.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Artem Lapkin <email2tema@gmail.com>, Zhaofeng Li <hello@zhaofeng.li>,
 Ramon Fried <rfried.dev@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 3/3] cmd: pxe: use strdup to copy config
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 28/10/2022 11:01, Patrick Delaunay wrote:
> Replace malloc and strcpy by strdup in
> function parse_label_kernel.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>   boot/pxe_utils.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/boot/pxe_utils.c b/boot/pxe_utils.c
> index 756b201eda91..84e63c5cb85f 100644
> --- a/boot/pxe_utils.c
> +++ b/boot/pxe_utils.c
> @@ -1180,11 +1180,10 @@ static int parse_label_kernel(char **c, struct pxe_label *label)
>   	if (!s)
>   		return 1;
>   
> -	label->config = malloc(strlen(s) + 1);
> +	label->config = strdup(s);
>   	if (!label->config)
>   		return -ENOMEM;
>   
> -	strcpy(label->config, s);
>   	*s = 0;
>   
>   	return 1;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
