Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 475E9877C34
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Mar 2024 10:03:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E823AC6DD9C;
	Mon, 11 Mar 2024 09:03:45 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1AF49C6DD73
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:03:45 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33e9df3416bso75387f8f.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710147824; x=1710752624;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iLD3U1Mg6Q5EurtQ0xeMpGRIWV45FrY13A3s+WrKuzE=;
 b=mAb0DOER2ccTbIWfV67DpZ6KjkvlTlaIpRzmC/+HQ2YlDv0Ns/iMmeibjcwH585VXz
 qjqudjP37Q/DAU2VL66zbSeD99u50JN+76NZeMgUU46JaW8/tbJzYTvVaKXZELbILpD3
 qCFxdV1NO+uUPZaIYkyq9XPswQuA48Hha/5QyCm4B8f9ZeFk9m0K3WB/5kn22Fa0dV/5
 NEQW3tQOIqkCNdV67cNNO9zxnpd926tG71R/umHG/jsv9bL6Ankdx/iR490JoxQYK6V/
 eOF0T8bV3zOR+ZtPCdCs7gCr4Ch5YsL4c4HSTxBY5ycJYJfjjWCj5JstUXdlwvEeuAPZ
 FYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710147824; x=1710752624;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iLD3U1Mg6Q5EurtQ0xeMpGRIWV45FrY13A3s+WrKuzE=;
 b=jRhBm/TRlWdcZkCdZDAwwtDDPsUDeGLnf2+e3r6/HQIRwchhUc7ubSWIX1XzUbNWLg
 nbHKcTGAHtbZmAPHYK8a83GJQOmta9AWZxyBObKGCKwAhb7fW3e40TgSI51ekmLiZu/e
 /oTLkvW4tBNncLSlwneczaec+n1tiH3chIgGvv+LxTrE7VEPIiUDi02CVBSKm2ed5w+I
 PwiGLUsnvMVvbugIeYjXSUUIgA7fEiVDRT0mH6B/yx8oA8FTw+U6zjC3HQmg+Ri6fN0h
 hG48Y1hrB5vQIVCjBEsSFlO6OH+Ys7Yj/WFVGg2V0EA1p18UXryNCiVolhg147IKMqtx
 Me/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPyuTLevoykBhglUCb9pQ3nIVX+aPAdC2H95/haD8yF3FplOebMjOYoj9EdVao82KohRN2sd5paIrhAURJeKfjcjzQ58j6ddRwB1J//T3wqbbOThB9TPzq
X-Gm-Message-State: AOJu0Yxylu09IESYZ+2deqYsIQ82PozGH98IkIRRvhLuAgjJ3+poYGks
 UVoLpMaKlyUqE0fOP28BM/CDhbAadVk7/iICMDIHVyBIMbIrts0VyOXpivDbbdc=
X-Google-Smtp-Source: AGHT+IFJb1UlflnRJ1vxhZx5SlBp8RLThAKmOnxRp9zlqajiP3YFRHqq90hj7AqLg3nLXeETPQmCLw==
X-Received: by 2002:a5d:67cf:0:b0:33e:7380:df37 with SMTP id
 n15-20020a5d67cf000000b0033e7380df37mr4241387wrw.58.1710147824290; 
 Mon, 11 Mar 2024 02:03:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:48be:feb9:192b:f402?
 ([2a01:e0a:982:cbb0:48be:feb9:192b:f402])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adfa2d1000000b0033cf80ad6f5sm5907774wra.60.2024.03.11.02.03.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 02:03:43 -0700 (PDT)
Message-ID: <b22c78b3-09a1-4c7b-98be-87fac3bcd3af@linaro.org>
Date: Mon, 11 Mar 2024 10:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
To: u-boot-amlogic@groups.io, caleb.connolly@linaro.org,
 Tom Rini <trini@konsulko.com>, Sumit Garg <sumit.garg@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Simon Glass <sjg@chromium.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Kever Yang <kever.yang@rock-chips.com>, Lukasz Majewski <lukma@denx.de>,
 Sean Anderson <seanga2@gmail.com>, Sam Protsenko
 <semen.protsenko@linaro.org>, Matthias Brugger <mbrugger@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>, Ramon Fried
 <rfried.dev@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Weijie Gao <weijie.gao@mediatek.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Eugen Hristev <eugen.hristev@collabora.com>,
 Rick Chen <rick@andestech.com>, Leo <ycliang@andestech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Dai Okamura <okamura.dai@socionext.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-7-b7ff41925f92@linaro.org>
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
In-Reply-To: <20240304-b4-upstream-dt-headers-v1-7-b7ff41925f92@linaro.org>
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 uboot-snps-arc@synopsys.com
Subject: Re: [Uboot-stm32] [PATCH RFC 07/26] amlogic: drop dt-binding headers
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

On 11/03/2024 09:51, Caleb Connolly wrote:
> Dropped in favour of dts/upstream
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   .../clock/amlogic,a1-peripherals-clkc.h            | 168 ---------------------
>   include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |  25 ---
>   include/dt-bindings/clock/axg-aoclkc.h             |  31 ----
>   include/dt-bindings/clock/axg-audio-clkc.h         |  94 ------------
>   include/dt-bindings/clock/axg-clkc.h               | 100 ------------
>   include/dt-bindings/clock/g12a-aoclkc.h            |  36 -----
>   include/dt-bindings/clock/g12a-clkc.h              | 153 -------------------
>   include/dt-bindings/clock/gxbb-aoclkc.h            |  74 ---------
>   include/dt-bindings/clock/gxbb-clkc.h              | 151 ------------------
>   include/dt-bindings/gpio/meson-a1-gpio.h           |  73 ---------
>   include/dt-bindings/gpio/meson-axg-gpio.h          | 116 --------------
>   include/dt-bindings/gpio/meson-g12a-gpio.h         | 114 --------------
>   include/dt-bindings/gpio/meson-gxbb-gpio.h         | 148 ------------------
>   include/dt-bindings/gpio/meson-gxl-gpio.h          | 125 ---------------
>   include/dt-bindings/power/meson-a1-power.h         |  32 ----
>   include/dt-bindings/power/meson-axg-power.h        |  14 --
>   include/dt-bindings/power/meson-g12a-power.h       |  13 --
>   include/dt-bindings/power/meson-gxbb-power.h       |  13 --
>   include/dt-bindings/power/meson-sm1-power.h        |  18 ---
>   include/dt-bindings/reset/amlogic,meson-a1-reset.h |  76 ----------
>   .../reset/amlogic,meson-axg-audio-arb.h            |  19 ---
>   .../dt-bindings/reset/amlogic,meson-axg-reset.h    | 123 ---------------
>   .../reset/amlogic,meson-g12a-audio-reset.h         |  53 -------
>   .../dt-bindings/reset/amlogic,meson-g12a-reset.h   | 137 -----------------
>   .../dt-bindings/reset/amlogic,meson-gxbb-reset.h   | 161 --------------------
>   include/dt-bindings/reset/axg-aoclkc.h             |  20 ---
>   include/dt-bindings/reset/g12a-aoclkc.h            |  18 ---
>   include/dt-bindings/reset/gxbb-aoclkc.h            |  66 --------
>   include/dt-bindings/sound/meson-aiu.h              |  18 ---
>   include/dt-bindings/sound/meson-g12a-toacodec.h    |  10 --
>   include/dt-bindings/sound/meson-g12a-tohdmitx.h    |  13 --
>   31 files changed, 2212 deletions(-)
> 

<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
