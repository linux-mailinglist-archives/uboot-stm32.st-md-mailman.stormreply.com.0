Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C95B7CD597
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Oct 2023 09:42:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 514D4C6C838;
	Wed, 18 Oct 2023 07:42:43 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C063AC6C831
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 07:42:40 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-32d9cb5e0fcso4275176f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Oct 2023 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697614960; x=1698219760;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PRTgNSOsXG0F9aLy2A/XE7NkoPOUWrEtgTPGGPgARJc=;
 b=ouzpymWS79BXPD9GFwIqJ3cUMO+Kvm0bi+pIxUHbIC7BxnxpvuBk+myLSe5lcFVrt8
 J/5PSpxxLwlyhrGxn8EniG4R7erw81vt22fqXXTga1E+TF2FIfWVv00r2TV40oyBoo4d
 RtrEN3kpY/afb2l1i8rWuLjzwaPWqKF1a1gm5Tl9UPKx5r4JOeLbBl8cso8vIYIQqWSm
 mX7E9GM6Ai9jII1JAuY+c4mU8LrzadDinMuh2wyNdw6Fs7Aqal1oX6GRpmLXI9Oqa8WG
 qG3XLq4n3uJPi/XmNEgUtC1UwlWh412NK5DO2nQRGK7m1hqad/qiG0iFGaPxSE/2F6G8
 MDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697614960; x=1698219760;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PRTgNSOsXG0F9aLy2A/XE7NkoPOUWrEtgTPGGPgARJc=;
 b=ofcNPIJ2g/eM/kCubdRHTUFIftX6zYUDNbp1e400XcAkDQhVvOpKENxpy0645bS+ZA
 dk/fLmoB/frfzGMBqSNOq8S8/2uzIYIk1x6hntMF0Rk6ymr+tpazKDAEJjfhf2KI7igi
 X0FgiZ70BfuVoTK5KJcCb0m3fW6C1zrzJdWI2RHR6nUjYBmxCfiiUTh4P8wIW/QZ4pFi
 5C2g3yGZc2V05Ds+3lVPBRXGW2iB2Dyf2jlRjHUo5LqKjNsSfjvZqwg4ZRFcfgNm7XZQ
 GRCBlJSDHsUuKQ7YoN7yr5qRCG+snHMPupOGRQm/n3YTX74TZBaUdWQsrzou3U5tfkAc
 jYVw==
X-Gm-Message-State: AOJu0Yyd1apailJY1/QB1+7T8M5yv4guFjCUqc8VjGq+pqDRmX4sdAdh
 Zx7zvHGKxPcBmbhOhX2sxM/Smg==
X-Google-Smtp-Source: AGHT+IFiMpUuxGLmnXBwvD/drZlOEpAchJMyhKaL9bfQNVx829Dm25kk6dI8KZmZfEjwb96fX66SSg==
X-Received: by 2002:adf:ec0f:0:b0:317:67bf:3376 with SMTP id
 x15-20020adfec0f000000b0031767bf3376mr3658884wrn.57.1697614960106; 
 Wed, 18 Oct 2023 00:42:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d8f:701:423:3d05?
 ([2a01:e0a:982:cbb0:5d8f:701:423:3d05])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a056000128400b0031c5e9c2ed7sm1457010wrx.92.2023.10.18.00.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 00:42:39 -0700 (PDT)
Message-ID: <d4fa0c3a-a6a1-4c06-8f9e-f59086201069@linaro.org>
Date: Wed, 18 Oct 2023 09:42:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
To: Igor Prusov <ivprusov@sberdevices.ru>, Michal Simek
 <michal.simek@amd.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
 Lukasz Majewski <lukma@denx.de>, Sean Anderson <seanga2@gmail.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Stefan Roese <sr@denx.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
References: <20231017165649.1492-1-ivprusov@sberdevices.ru>
 <20231017165649.1492-5-ivprusov@sberdevices.ru>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231017165649.1492-5-ivprusov@sberdevices.ru>
Cc: Aspeed BMC SW team <BMC-SW@aspeedtech.com>, u-boot-amlogic@groups.io,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Joel Stanley <joel@jms.id.au>, kernel@sberdevices.ru, prusovigor@gmail.com
Subject: Re: [Uboot-stm32] [PATCH v4 4/8] clk: amlogic: Move driver and ops
	structs
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

On 17/10/2023 18:56, Igor Prusov wrote:
> Move driver and ops structs to avoid forward declaration after switching
> to dump in clk_ops.
> 
> Signed-off-by: Igor Prusov <ivprusov@sberdevices.ru>
> ---
>   drivers/clk/meson/a1.c | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/clk/meson/a1.c b/drivers/clk/meson/a1.c
> index 1075ba7333..e3fa9db7d0 100644
> --- a/drivers/clk/meson/a1.c
> +++ b/drivers/clk/meson/a1.c
> @@ -601,14 +601,6 @@ static int meson_clk_set_parent(struct clk *clk, struct clk *parent_clk)
>   	return meson_mux_set_parent_by_id(clk, parent_clk->id);
>   }
>   
> -static struct clk_ops meson_clk_ops = {
> -	.disable	= meson_clk_disable,
> -	.enable		= meson_clk_enable,
> -	.get_rate	= meson_clk_get_rate,
> -	.set_rate	= meson_clk_set_rate,
> -	.set_parent	= meson_clk_set_parent,
> -};
> -
>   static int meson_clk_probe(struct udevice *dev)
>   {
>   	struct meson_clk *priv = dev_get_priv(dev);
> @@ -638,15 +630,6 @@ static const struct udevice_id meson_clk_ids[] = {
>   	{ }
>   };
>   
> -U_BOOT_DRIVER(meson_clk) = {
> -	.name		= "meson-clk-a1",
> -	.id		= UCLASS_CLK,
> -	.of_match	= meson_clk_ids,
> -	.priv_auto	= sizeof(struct meson_clk),
> -	.ops		= &meson_clk_ops,
> -	.probe		= meson_clk_probe,
> -};
> -
>   static const char *meson_clk_get_name(struct clk *clk, int id)
>   {
>   	const struct meson_clk_info *info;
> @@ -727,3 +710,20 @@ int soc_clk_dump(void)
>   
>   	return 0;
>   }
> +
> +static struct clk_ops meson_clk_ops = {
> +	.disable	= meson_clk_disable,
> +	.enable		= meson_clk_enable,
> +	.get_rate	= meson_clk_get_rate,
> +	.set_rate	= meson_clk_set_rate,
> +	.set_parent	= meson_clk_set_parent,
> +};
> +
> +U_BOOT_DRIVER(meson_clk) = {
> +	.name		= "meson-clk-a1",
> +	.id		= UCLASS_CLK,
> +	.of_match	= meson_clk_ids,
> +	.priv_auto	= sizeof(struct meson_clk),
> +	.ops		= &meson_clk_ops,
> +	.probe		= meson_clk_probe,
> +};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
