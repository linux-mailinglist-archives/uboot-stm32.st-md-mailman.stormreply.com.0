Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A1591BC89
	for <lists+uboot-stm32@lfdr.de>; Fri, 28 Jun 2024 12:23:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6DD6AC71289;
	Fri, 28 Jun 2024 10:23:17 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E368C6DD9F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 10:23:10 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a72517e6225so53091866b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719570190; x=1720174990;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MqsgQ1eLQ0uiSW4nlzjnB3sCbmoe62JZW1v1i4GDWP0=;
 b=TfusKnwOEWpxt3FwmOZLXOFKfvgrXt00Uac30TQR4nI+VUa6EVo/lCS422F6D0+/Zy
 CqgkmqpuJnocYcHjxGeT+H7L5+ifaJG9ubM/agFMqkFvnY9d5SZNnIDWcg2l+Qx/LZVZ
 6c1vlPJH9yhQhIDuf2CXIfBVIfj9YANYE/leJShWMWXhntr4bBGRvgfySr3d10E3ArWj
 +/H9Srwerdil25y7zw0Hd4lmlWPBg4MBcfmxhFYhgdLEKpBZR/HF4mVik9pskyQxlV+K
 5wn6UpyXr6TRG+13o2oVAsndhksd69YXiEdG18x2NfeCwsV4+5Bq9T58mn1mcbHUnNsS
 F0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719570190; x=1720174990;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MqsgQ1eLQ0uiSW4nlzjnB3sCbmoe62JZW1v1i4GDWP0=;
 b=jNIGS1EohmhV/pgwPbMRyOV4+gQxfWuRYO9CmHVX8S6965i+4A63jO3T5J+EWj6D48
 8XkDvslnZP/x6dRgBIAy81IQbjohRxtTkwI3gKp4p8hmSIX1ozow3bgaUV78TNbesrNY
 GSAKogK66lyFtXAwZjBfaa5+l0m7l75PYN8eSHDysjPoFbLlrSfT++rGScYHCG8TmWwq
 FeUk7eKAsZ6OJXCGN+TvNUNKcC2QzGK3NDRInnek16bss5bdCEdDC04v30rzFQ3GoPNN
 +AxvjrV9QtyogGM0nxcIySfpg35nwD9gbShnqB5GCHXbPzfvwszlVw7ojcQf2jX481VQ
 uR9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUofIRUwZK3UQPcr6PC+SD0KtwxOt9xwDhh2qIxFHV4bhZbTd5+tO+90pW9eWfXgkb0NJTp/Asg6htG+H4sSh1pn7+BiS9Jd4tOTYu3pMlgncPpulmaj1y
X-Gm-Message-State: AOJu0YzbEcXRILy2LjddbObAx7EUpmzBFi3+qPHE0NqkoAaP18Z4+Ag3
 yNRukP07r8M6MWtStGnX1qB+OgJUkQn+LeSkM7zZkCKExuhy7OieJCDjqZRwjFU=
X-Google-Smtp-Source: AGHT+IENOK4lyqsP/C8G9OL/LSuejh4RLzbOPyh/vsC53PQVajvsTQbEU6Pj24oQWwBk6lN+2hZQPQ==
X-Received: by 2002:a17:907:874e:b0:a72:8323:4298 with SMTP id
 a640c23a62f3a-a7283234518mr590607166b.68.1719570189850; 
 Fri, 28 Jun 2024 03:23:09 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::18f8? ([2a02:8109:aa0d:be00::18f8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63914sm65811366b.87.2024.06.28.03.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jun 2024 03:23:09 -0700 (PDT)
Message-ID: <7fcaa045-2d27-483e-84d1-72c0434854d2@linaro.org>
Date: Fri, 28 Jun 2024 12:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Glass <sjg@chromium.org>
References: <20240626235717.272219-1-marex@denx.de>
 <CAFLszTjwbWdKqs_UBqXvr2F2ahoGd0-BFE-XLNr3-uq73ZLFHg@mail.gmail.com>
 <b84e8b10-8698-41f2-9648-0b3f5c399b02@linaro.org>
 <CAFLszTijRhB1dRraPBQSTU3ypJ_wJU7yghJ9c9Rk-XcbcfvkFg@mail.gmail.com>
 <38150a1b-6c71-4b42-a8ec-6b0de8ad6848@linaro.org>
 <CAFLszTg078XuQ5WxUVvMktA95zZm+PHs+MtVu2eL-xZYYkHxFA@mail.gmail.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CAFLszTg078XuQ5WxUVvMktA95zZm+PHs+MtVu2eL-xZYYkHxFA@mail.gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, Sam Day <me@samcday.com>,
 Kever Yang <kever.yang@rock-chips.com>, u-boot@lists.denx.de,
 Max Krummenacher <max.krummenacher@toradex.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Dragan Simic <dsimic@manjaro.org>,
 Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 u-boot-qcom@groups.io, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 u-boot-amlogic@groups.io, Jaehoon Chung <jh80.chung@samsung.com>,
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

Hi Simon,

>>>>>
>>>>> This is reading a lot of DT stuff very early, which may be slow. It is
>>>>> also reading from the DT in the bind() step which we sometimes have to
>>>>> do, but try to avoid.
>>>>
>>>> Could we set up the livetree pre-bind? What about MMU? On armv8 at least
>>>> this would have a huge impact on performance. I've done some
>>>> measurements and there is at least 1 order of magnitude difference
>>>> between parsing FDT with no caches vs parsing livetree with, it's huge.
>>>
>>> That seems like a great idea to me, in general. The fact that SPL sets
>>> up the MMU on armv8 makes it more practical.
>>
>> Well, on qcom we don't use SPL (yet?), we did have a cyclical dependency
>> since we rely on DTB for the memory layout, although I have some patches
>> to do all the memory parsing in board_fdt_blob_setup() since that's
>> needed for multi-dtb FIT. So I guess we could enable caches at the same
>> time.
> 
> Yes...it seems that enabling cache in SPL has become common on armv8.
> 
> As to the memory layout, I'm not sure what is happening there, but it
> seems that the DT does not describe it in general (at least not until
> U-Boot adds the nodes).

I suppose this depends on the platform. On Qualcomm we use DT as the 
source of truth as it lets us support many platforms (with totally 
different memory maps) with a single U-Boot binary, at least for 
development this is quite nice.
> 
>>>
>>> But for this series I believe we are going to have to define what
>>> happens in what phase. We have power_init_board() which is the old way
>>> of doing this...but perhaps we could use that as a way to start up
>>> regulators which are needed.
>>>
>>> As to my question about whether this happens in SPL / pre-reloc /
>>> proper, I forgot that we have the bootph tags for that, so it should
>>> be fine. The main issue is that in U-Boot proper we will re-init the
>>> regulators even though that has already been done. Probably that can
>>> be handled by Kconfig or a flag in SPL handoff.
>>
>> Ensuring that it isn't done multiple times sounds like the right
>> approach to me.
> 
> OK...I wonder how we can solve this. Needs some though.
> 
> 
>>>
>>>
>>>>>
>>>>> Also this seems to happen in SPL and again pre-reloc and again in
>>>>> U-Boot post-reloc?
>>>>>
>>>>> Should we have a step in the init sequence where we set up the
>>>>> regulators, by calling regulators_enable_boot_on() ?
> 
> Regards,
> Simon

-- 
// Caleb (they/them)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
