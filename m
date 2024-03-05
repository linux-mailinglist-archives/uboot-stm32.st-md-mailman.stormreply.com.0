Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB76871F7E
	for <lists+uboot-stm32@lfdr.de>; Tue,  5 Mar 2024 13:51:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6310C6DD69;
	Tue,  5 Mar 2024 12:51:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF5FBC62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Mar 2024 12:51:41 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-33e4d36f288so270748f8f.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Mar 2024 04:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709643101; x=1710247901;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x91VJBZqjXRLt3HCTujHvFpj+vG9EQ3dOOSIkLwi6Rw=;
 b=XffswFah8ebWiP022j/XECI4yPYjNI4/GLKcYfd9NcSSM67rgFoxdCUSxKjXlBY/tp
 dYERD1nWMjm1bSYq6NA8hwJvvBI5BJvZognoqM/JoSxF0JRb50BlqP1yS9DXWmS7RA8Z
 dSbRgu32LnDpaNToQ/baItRYtuoDTylz7SkKSZRhwg3ZoyAtQxnVm0iqt+xsK4U1EP1Z
 h46XW9oR8EOwfUKlaTN2NMJnzasRaZNBVM0TFIsBBPDAf+7hvhb2tOVZjIJjdokMMC0U
 dkoWcXGWQKUojqOmWNyTbonz3kMQ/unxMoi8WfvB6u7NdFiFM0k/vdkZe05ZJe3TyV6q
 h7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709643101; x=1710247901;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x91VJBZqjXRLt3HCTujHvFpj+vG9EQ3dOOSIkLwi6Rw=;
 b=keOaJ5yrxQKPd/AhozS//aRZqkrQu0SjXpbMk4K/YKCRq7VuynGkUzXGPW73AvKR4r
 A5sfhZG7n3Im3VS/nXU3ik/nvRF0wh/KR/eBGfUnLgZB21snUVp4VHZlDar0Or8+smEV
 NP/NvS/DICU5Fc/yLrAs3Sqx2/aE0/jSCUvthBuKTLAfaOb0XGv/2zWCb3YFKO92bvRt
 lHRDWZy7LpSaiGf0WbAgxQGKjis9QOrNge+e6VkRiev3drvQxBh1EktNJ/HXfms81zpE
 47gGAWutbEWM/Xy7+KdpYS9nO4gkkfxR0+meMVQ/+NGBfBtvsV40/MjOV971qvkFxuXN
 T8mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr844lBWvb3YkmqzjkJx9Zuk2eWmj7mg5OfILz8u97o6TeM9iprxxWXOjT4d/SdZ1rGpfArOZFG+JKyKmvEqevjbG07UJ6xR2XCEHr5tj8FwMLfR7pCGBR
X-Gm-Message-State: AOJu0YxPUmFbLqUTox1LzYSj00jGxB8Kcau1C4qRSM+CcjjT4l59TekI
 CaObbb6cCTGqiJXTEvAcjDYFZz+7qgXBDVqwar8JGxrIQg+1W3RJwXGEcYmc+50=
X-Google-Smtp-Source: AGHT+IHnT6DPSQterrn8gdAzpmDRRKm3ffEfvNCc0pY3+OmjAlf4/PwRTEQcSOEXen96G54bD8IYvA==
X-Received: by 2002:a05:6000:22e:b0:33d:8ebf:4f6 with SMTP id
 l14-20020a056000022e00b0033d8ebf04f6mr1957148wrz.20.1709643101208; 
 Tue, 05 Mar 2024 04:51:41 -0800 (PST)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
 by smtp.gmail.com with ESMTPSA id
 ck4-20020a5d5e84000000b0033e2b9f647asm9147469wrb.31.2024.03.05.04.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 04:51:40 -0800 (PST)
Message-ID: <3e17d3e4-e2e1-45ff-9d62-44bf5a8991df@linaro.org>
Date: Tue, 5 Mar 2024 12:51:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Sumit Garg <sumit.garg@linaro.org>
References: <20240304-b4-upstream-dt-headers-v1-0-b7ff41925f92@linaro.org>
 <20240304-b4-upstream-dt-headers-v1-26-b7ff41925f92@linaro.org>
 <CAFA6WYM6sTEdw+VphKidUqjQW61eW8ZVq+oO35CJVM=5wPoniA@mail.gmail.com>
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <CAFA6WYM6sTEdw+VphKidUqjQW61eW8ZVq+oO35CJVM=5wPoniA@mail.gmail.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Joe Hershberger <joe.hershberger@ni.com>,
 uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Sam Protsenko <semen.protsenko@linaro.org>,
 Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
 Weijie Gao <weijie.gao@mediatek.com>, Lukasz Majewski <lukma@denx.de>,
 u-boot-amlogic@groups.io, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Thierry Reding <treding@nvidia.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Peter Robinson <pbrobinson@gmail.com>, Dai Okamura <okamura.dai@socionext.com>,
 Aspeed BMC SW team <BMC-SW@aspeedtech.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, Rick Chen <rick@andestech.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, uboot-snps-arc@synopsys.com,
 Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 GSS_MTK_Uboot_upstream <GSS_MTK_Uboot_upstream@mediatek.com>
Subject: Re: [Uboot-stm32] [PATCH RFC 26/26] dts: support building all dtb
 files for a specific vendor
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



On 05/03/2024 12:35, Sumit Garg wrote:
> Hi Caleb,
> 
> On Mon, 4 Mar 2024 at 22:22, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>>
>> This adjusts OF_UPSTREAM to behave more like the kernel by allowing for
>> all the devicetree files for a given vendor to be compiled. This is
>> useful for Qualcomm in particular as most boards are supported by a
>> single U-Boot build just provided with a different DT.
>>
>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>> ---
>>  dts/Kconfig          | 24 ++++++++++++++++++++++++
>>  scripts/Makefile.dts | 17 ++++++++++++++++-
>>  2 files changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/dts/Kconfig b/dts/Kconfig
>> index b9b6367154ef..67d9dc489856 100644
>> --- a/dts/Kconfig
>> +++ b/dts/Kconfig
>> @@ -100,8 +100,32 @@ config OF_UPSTREAM
>>           However, newer boards whose devicetree source files haven't landed in
>>           the dts/upstream subtree, they can override this option to have the
>>           DT build from existing U-Boot tree location instead.
>>
>> +config OF_UPSTREAM_BUILD_VENDOR
>> +       bool "Build all devicetree files for a particular vendor"
>> +       depends on OF_UPSTREAM
>> +       help
>> +         Enable building all devicetree files for a particular vendor. This
> 
> Do we really want to build all the DTBs even if many of those aren't
> supported by U-Boot at all? I would have rather added Makefile targets
> for boards which really supports a single defconfig eg.
> qcom_defconfig.

Yes, for the 4 Qualcomm SoCs currently supported there are 51 dts
targets that ought to be able to run U-Boot to some extent

$ ls -l dts/upstream/src/arm6/qcom/{msm8916,sdm845,msm8996,qcs404}*.dts\
	| wc -l
51

What do you mean by a "makefile target"? Like copying
arch/arm64/boot/dts/qcom/Makefile from Linux? I guess my concern here
would be keeping it in sync, and introducing additional busywork when
porting.

We do have a lot of Qualcomm DTS files, it takes maybe 10 seconds to
compile them all on my machine, but that's only once. With incremental
builds this becomes largely irrelevant.
> 
> -Sumit
> 
>> +         is useful for generic U-Boot configurations where many boards can
>> +         be supported with a single binary.
>> +
>> +         This is only available for platforms using upstream devicetree.
>> +
>> +config OF_UPSTREAM_VENDOR
>> +       string "Vendor to build all upstream devicetree files for"
>> +       depends on OF_UPSTREAM_BUILD_VENDOR
>> +       default "qcom" if ARCH_SNAPDRAGON
>> +       default "rockchip" if ARCH_ROCKCHIP
>> +       default "amlogic" if ARCH_MESON
>> +       default "allwinner" if ARCH_SUNXI
>> +       default "mediatek" if ARCH_MEDIATEK
>> +       default "marvell" if ARCH_MVEBU
>> +       default "xilinx" if ARCH_VERSAL || ARCH_ZYNQ
>> +       default "nvidia" if ARCH_TEGRA
>> +       help
>> +         Select the vendor to build all devicetree files for.
>> +
>>  choice
>>         prompt "Provider of DTB for DT control"
>>         depends on OF_CONTROL
>>
>> diff --git a/scripts/Makefile.dts b/scripts/Makefile.dts
>> index 5e2429c6170c..8005527f3df7 100644
>> --- a/scripts/Makefile.dts
>> +++ b/scripts/Makefile.dts
>> @@ -1,3 +1,18 @@
>>  # SPDX-License-Identifier: GPL-2.0+
>>
>> -dtb-y += $(patsubst %,%.dtb,$(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
>> +dtb-y += $(patsubst %,%.dtb,\
>> +       $(subst ",,$(CONFIG_DEFAULT_DEVICE_TREE) $(CONFIG_OF_LIST) $(CONFIG_SPL_OF_LIST)))
>> +
>> +ifeq ($(CONFIG_OF_UPSTREAM_BUILD_VENDOR),y)
>> +ifeq ($(CONFIG_ARM64),y)
>> +dt_dir := $(srctree)/dts/upstream/src/arm64
>> +else
>> +dt_dir := $(srctree)/dts/upstream/src/$(ARCH)
>> +endif
>> +
>> +dtb-vendor_dts := $(patsubst %.dts,%.dtb, \
>> +       $(wildcard $(dt_dir)/$(subst ",,$(CONFIG_OF_UPSTREAM_VENDOR))/*.dts))
>> +
>> +dtb-y += $(subst $(dt_dir)/,,$(dtb-vendor_dts))
>> +
>> +endif
>>
>> --
>> 2.44.0
>>

-- 
// Caleb (they/them)
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
