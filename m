Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2665991A1DB
	for <lists+uboot-stm32@lfdr.de>; Thu, 27 Jun 2024 10:48:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBF55C71282;
	Thu, 27 Jun 2024 08:48:56 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 747F4C71280
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 08:48:50 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a6fdd947967so584530766b.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 01:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719478130; x=1720082930;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PQWX+luspyCXe7Er1ZSMyswIEZzqq2frk40BZPN/01Y=;
 b=alJ0HVyMs3cq48IyQZXv/w3X219+xwAW0oplYyvxFCwbYoKMYWZ6cm4OpDnFh6U/54
 ZusVzLvvx/FWTxwPDghJfNFFXYo2Wi+MQRPjysrI2Q/1/wHn+WxZrs4R7S3BfYMeS/d6
 TiFhNkl3N5WZuMLVBb0Ec5SjrXBmljv4QwyArMTfCCCd1n07lCoOgVkOCQSHlM9mhnUS
 TQnDZQjy6atHrzC0fLVeyZ2B2WbmvFdM6gW2tWjKWWn9rGfcLBCPVM8YEgP9yI6RtMua
 yL8L2s5aGd8n4l6dSwcMDE57pi3D3UvQae2gFMVonVs8w6qzx1gnjjfr0Bs5u6NVHAQD
 HtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719478130; x=1720082930;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PQWX+luspyCXe7Er1ZSMyswIEZzqq2frk40BZPN/01Y=;
 b=D1JmHcCH7lkNfTQa32xMO+5gtPEyd/xiSd/3CFKIed4ZREjr9vnYT5uVOQTpATVZob
 FzaLKXuTuufYaL1KD/aqHFIKXJEgHOuNIikMrGxzawcx03nyRzFjKubQoPSSxb7jSfla
 gfE+n2JEazSZh6Tde+of0hJxXuVn8vv+Evsc017PefgfvRVYBpB5W/tHFLxSLMrX6bNz
 A5qHG5LywfIDRLmfkbwgWinJjoD4ScdspiDqEWGDYX+hABzPi6Vm9DOGUGmzd02p4wKQ
 sPfXUJFlF+IB3doLg5YF+lG+KjmiVwy0abcQYDoeBtnvthfFY/HhbWukzG+nT4B6yKbF
 1+XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/ZUTxS+QntQLI5icK5TReTWX3xsFNeIqrrUAl0jzptVkB8txA0ZvHjL8C3YF2EJsUykV46u+7mmfZpFbIve+1bGVo2Tn2fMCnBbvlkLyHOf0f7MjH+75x
X-Gm-Message-State: AOJu0YxpvgHeVbpXdOlZN8z8kx5098lYcmK63IIMuUtsSPD5ozhQ5atc
 IGJRfi11yGbAuFy/GTHu0Z4XkA6/F19aKU86z+V8v5YbK0tfZbWmAy8ENeqSfZI=
X-Google-Smtp-Source: AGHT+IHx00dY630Um06yB7PSZgoB5BMl1TlmFaISRXKiaH+xdDQo+IeYUMNUQ7mjfln6sy8TSDV3GA==
X-Received: by 2002:a17:907:9726:b0:a72:a05a:6601 with SMTP id
 a640c23a62f3a-a72a05a674dmr73486066b.14.1719478129673; 
 Thu, 27 Jun 2024 01:48:49 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::18f8? ([2a02:8109:aa0d:be00::18f8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a729d71f5b7sm38416266b.75.2024.06.27.01.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jun 2024 01:48:49 -0700 (PDT)
Message-ID: <b84e8b10-8698-41f2-9648-0b3f5c399b02@linaro.org>
Date: Thu, 27 Jun 2024 10:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>, Marek Vasut <marex@denx.de>
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Tom Rini <trini@konsulko.com>, u-boot-qcom@groups.io,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, u-boot-amlogic@groups.io,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Kostya Porotchkin <kostap@marvell.com>,
 Ben Wolsieffer <benwolsieffer@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Jonas Karlman <jonas@kwiboo.se>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Chris Morgan <macromorgan@hotmail.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, u-boot@dh-electronics.com,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Sumit Garg <sumit.garg@linaro.org>
Subject: Re: [Uboot-stm32] [PATCH 1/4] power: regulator: Trigger probe of
 regulators which are always-on or boot-on
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



On 27/06/2024 10:37, Simon Glass wrote:
> Hi Marek,
> 
> On Thu, 27 Jun 2024 at 00:57, Marek Vasut <marex@denx.de> wrote:
>>
>> In case a regulator DT node contains regulator-always-on or regulator-boot-on
>> property, make sure the regulator gets correctly configured by U-Boot on start
>> up. Unconditionally probe such regulator drivers. This is a preparatory patch
>> for introduction of .regulator_post_probe() which would trigger the regulator
>> configuration.
>>
>> Parsing of regulator-always-on and regulator-boot-on DT property has been
>> moved to regulator_post_bind() as the information is required early, the
>> rest of the DT parsing has been kept in regulator_pre_probe() to avoid
>> slowing down the boot process.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Cc: Ben Wolsieffer <benwolsieffer@gmail.com>
>> Cc: Caleb Connolly <caleb.connolly@linaro.org>
>> Cc: Chris Morgan <macromorgan@hotmail.com>
>> Cc: Dragan Simic <dsimic@manjaro.org>
>> Cc: Eugen Hristev <eugen.hristev@collabora.com>
>> Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
>> Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>
>> Cc: Jaehoon Chung <jh80.chung@samsung.com>
>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>> Cc: Jonas Karlman <jonas@kwiboo.se>
>> Cc: Kever Yang <kever.yang@rock-chips.com>
>> Cc: Kostya Porotchkin <kostap@marvell.com>
>> Cc: Matteo Lisi <matteo.lisi@engicam.com>
>> Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>
>> Cc: Max Krummenacher <max.krummenacher@toradex.com>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
>> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>
>> Cc: Quentin Schulz <quentin.schulz@cherry.de>
>> Cc: Sam Day <me@samcday.com>
>> Cc: Simon Glass <sjg@chromium.org>
>> Cc: Sumit Garg <sumit.garg@linaro.org>
>> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
>> Cc: Thierry Reding <treding@nvidia.com>
>> Cc: Tom Rini <trini@konsulko.com>
>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Cc: u-boot-amlogic@groups.io
>> Cc: u-boot-qcom@groups.io
>> Cc: u-boot@dh-electronics.com
>> Cc: u-boot@lists.denx.de
>> Cc: uboot-stm32@st-md-mailman.stormreply.com
>> ---
>>   drivers/power/regulator/regulator-uclass.c | 22 +++++++++++++++-------
>>   1 file changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/power/regulator/regulator-uclass.c b/drivers/power/regulator/regulator-uclass.c
>> index 66fd531da04..ccc4ef33d83 100644
>> --- a/drivers/power/regulator/regulator-uclass.c
>> +++ b/drivers/power/regulator/regulator-uclass.c
>> @@ -433,6 +433,8 @@ static int regulator_post_bind(struct udevice *dev)
>>          const char *property = "regulator-name";
>>
>>          uc_pdata = dev_get_uclass_plat(dev);
>> +       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
>> +       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
>>
>>          /* Regulator's mandatory constraint */
>>          uc_pdata->name = dev_read_string(dev, property);
>> @@ -444,13 +446,21 @@ static int regulator_post_bind(struct udevice *dev)
>>                          return -EINVAL;
>>          }
>>
>> -       if (regulator_name_is_unique(dev, uc_pdata->name))
>> -               return 0;
>> +       if (!regulator_name_is_unique(dev, uc_pdata->name)) {
>> +               debug("'%s' of dev: '%s', has nonunique value: '%s\n",
>> +                     property, dev->name, uc_pdata->name);
>> +               return -EINVAL;
>> +       }
>>
>> -       debug("'%s' of dev: '%s', has nonunique value: '%s\n",
>> -             property, dev->name, uc_pdata->name);
>> +       /*
>> +        * In case the regulator has regulator-always-on or
>> +        * regulator-boot-on DT property, trigger probe() to
>> +        * configure its default state during startup.
>> +        */
>> +       if (uc_pdata->always_on && uc_pdata->boot_on)
>> +               dev_or_flags(dev, DM_FLAG_PROBE_AFTER_BIND);
>>
>> -       return -EINVAL;
>> +       return 0;
>>   }
>>
>>   static int regulator_pre_probe(struct udevice *dev)
>> @@ -473,8 +483,6 @@ static int regulator_pre_probe(struct udevice *dev)
>>                                                  -ENODATA);
>>          uc_pdata->max_uA = dev_read_u32_default(dev, "regulator-max-microamp",
>>                                                  -ENODATA);
>> -       uc_pdata->always_on = dev_read_bool(dev, "regulator-always-on");
>> -       uc_pdata->boot_on = dev_read_bool(dev, "regulator-boot-on");
>>          uc_pdata->ramp_delay = dev_read_u32_default(dev, "regulator-ramp-delay",
>>                                                      0);
>>          uc_pdata->force_off = dev_read_bool(dev, "regulator-force-boot-off");
>> --
>> 2.43.0
>>
> 
> This is reading a lot of DT stuff very early, which may be slow. It is
> also reading from the DT in the bind() step which we sometimes have to
> do, but try to avoid.

Could we set up the livetree pre-bind? What about MMU? On armv8 at least 
this would have a huge impact on performance. I've done some 
measurements and there is at least 1 order of magnitude difference 
between parsing FDT with no caches vs parsing livetree with, it's huge.
> 
> Also this seems to happen in SPL and again pre-reloc and again in
> U-Boot post-reloc?
> 
> Should we have a step in the init sequence where we set up the
> regulators, by calling regulators_enable_boot_on() ?
> 
> Regards,
> Simon

-- 
// Caleb (they/them)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
