Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C170B762
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 May 2023 10:16:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDBD4C6A614;
	Mon, 22 May 2023 08:16:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11FD1C6A5E6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 08:16:19 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-3094910b150so4573599f8f.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 May 2023 01:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684743378; x=1687335378;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=AgQHXRqBL6sIjekEHRGeb4d9imcdcXKEJ98OIw4yTKg=;
 b=XBA9c08aavHUcbKsMbvGBuDaMjzzm1hyLnxUv/iESOzE6jn4Wiu/Yf3lO/PSv4rv1i
 WD6l0cGyMEE7VwwYTnTZ7CyU76egcTtiK/VkSdx4mFAhcQz3GPmXCQ9e2bntSmr+dIUW
 yKCwcu/h+KJ+2fF1Sj1h6k2L2l79R0RNy1pSjXu0qn/6/3CE8OPo1sqpeMX3+PUKZxaP
 7xevqo3ao58RsmEz7ZFKsZtms4LLQnFNdKImCdu53HQnOvA/EGl9l8SYI3BCTJL03fHL
 HNCI8pEa+AdY6AegGEzg8QTV8u1YdZqAeWKYL8W4RCG1osF6strkA2WjJ9OdMfkJz29Q
 Q0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684743378; x=1687335378;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AgQHXRqBL6sIjekEHRGeb4d9imcdcXKEJ98OIw4yTKg=;
 b=W4HDk3RgepTfBMSAPZuXUUyAxcLc9W6+RWmCodbWg6vdOm/zgNhANDsEXV8IOrZF/K
 x9EY21BbO9qIHurH5w7Hd6/ekit9myJM/3R6kwo/wD8Dz/13ngkNJEwlIqZaxQyhXSuN
 ogh7WFFqeL+a18DjpszViJR2W4B8LJZcWdxQVGMcrM0iUYRs2fdX/ulyE/GNZ/ujOABU
 iOPV+6iz8/h+4jOlvXjK+usEmAZhR/76bZO/BfSras8Q/SdknhytJurXuEt1HLRWi2G2
 f97UyN9gchxUhnDaE/FDUtnT7X5IalHSvbN89Wr7SCpzJGaattRvexgzHtiI+qSVDY76
 7DJg==
X-Gm-Message-State: AC+VfDxG7/PmOq0RrSh3E+FkI/UmP23KM/qP+3ALNUGFk+jqHfGbYPGh
 Cpq/HCL30FAgN9TPppCJvMXbmw==
X-Google-Smtp-Source: ACHHUZ7C9K3ZOq8uMNAVNRGqwRq3cjh+jBqkPlZtFFIj52yBrPiJzm3KEY9nNs2ToYVi5vtErIP1Wg==
X-Received: by 2002:a5d:5252:0:b0:307:8548:f793 with SMTP id
 k18-20020a5d5252000000b003078548f793mr6945585wrc.53.1684743378459; 
 Mon, 22 May 2023 01:16:18 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d4244000000b00307bc4e39e5sm6764094wrr.117.2023.05.22.01.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 01:16:18 -0700 (PDT)
Message-ID: <4e3a7b8f-b5e0-4f66-fa10-a37df0eee7c4@linaro.org>
Date: Mon, 22 May 2023 10:16:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>, u-boot@lists.denx.de,
 git@xilinx.com, Tom Rini <trini@konsulko.com>
References: <0dbdf0432405c1c38ffca55703b6737a48219e79.1684307818.git.michal.simek@amd.com>
Organization: Linaro Developer Services
In-Reply-To: <0dbdf0432405c1c38ffca55703b6737a48219e79.1684307818.git.michal.simek@amd.com>
Cc: uboot-snps-arc@synopsys.com, Fabio Estevam <festevam@denx.de>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Stefan Bosch <stefan_b@posteo.net>, Joe Hershberger <joe.hershberger@ni.com>,
 Michael Walle <michael@walle.cc>, Will Deacon <willdeacon@google.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
 Luka Perkov <luka.perkov@sartura.hr>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Matthias Winker <matthias.winker@de.bosch.com>, Niel Fourie <lusus@denx.de>,
 Lukasz Majewski <lukma@denx.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
 Uri Mashiach <uri.mashiach@compulab.co.il>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Roger Knecht <rknecht@pm.me>,
 Stefan Roese <sr@denx.de>,
 =?UTF-8?Q?Javier_Mart=c3=adnez_Canillas?= <javier@dowhile0.org>,
 Harald Seiler <hws@denx.de>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Holger Brunck <holger.brunck@hitachienergy.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, Jonas Karlman <jonas@kwiboo.se>,
 Enric Balletbo i Serra <eballetbo@gmail.com>,
 Rajesh Bhagat <rajesh.bhagat@nxp.com>, Philip Oberfichtner <pro@denx.de>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Nikhil M Jain <n-jain1@ti.com>,
 Chris Morgan <macromorgan@hotmail.com>, Igor Opaniuk <igor.opaniuk@gmail.com>,
 Johan Jonker <jbx6244@gmail.com>, Robert Marko <robert.marko@sartura.hr>,
 Dillon Min <dillon.minfei@gmail.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 =?UTF-8?Q?Pierre-Cl=c3=a9ment_Tosi?= <ptosi@google.com>,
 Heiko Schocher <hs@denx.de>, Vikas Manocha <vikas.manocha@st.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, u-boot-amlogic@groups.io,
 Kamil Lulko <kamil.lulko@gmail.com>, Qu Wenruo <wqu@suse.com>,
 Luka Kovacic <luka.kovacic@sartura.hr>, FUKAUMI Naoki <naoki@radxa.com>,
 Marc Zyngier <maz@kernel.org>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Shawn Guo <shawn.guo@linaro.org>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, linux-btrfs@vger.kernel.org
Subject: Re: [Uboot-stm32] [PATCH] global: Use proper project name U-Boot
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

On 17/05/2023 09:17, Michal Simek wrote:
> Use proper project name in comments, Kconfig, readmes.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>


For amlogic changes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


> ---
> 
> I am ignoring these for now because they can break automated scripts or
> user setting that's why they should be fixed separately.
> 

<snip>

> doc/board/amlogic/pre-generated-fip.rst:77:- bl33.bin: U-boot binary image

You can add this change safely,

Neil



<snip>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
