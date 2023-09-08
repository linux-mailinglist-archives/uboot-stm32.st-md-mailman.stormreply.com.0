Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEDF798E6D
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Sep 2023 20:52:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2011BC6B468;
	Fri,  8 Sep 2023 18:52:59 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08961C6B44F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Sep 2023 18:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1694199173; x=1694803973; i=xypron.glpk@gmx.de;
 bh=oXxS5W8W6JmJ1+46LCvUBQiaI6JMRaJKWS8P396IzqM=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RG6roqqhEiJ5Cfp7b85f6h2wfd2P7IihgNTrkYahiiIaCnJnvFjtAsuYnNTpTFjWUxTO8sG
 1uCZweGnuqyPnWt36xQMrpJPGqtLW2/EXxo3/s9GzLJFn22HvLf4R61MYbwo0gXwsU6GGF8C3
 VI4EIhrzEtc8956ECOdrlmgpRVjySeE9awOUhAKGItRSfoY646/nYhYP5ReqRMnZWNiNHI3t1
 oPLjSwAo36sE5brKyBkFzQFqEcQoSJ0aq4b4FJq5s1ed3T5O10E7xVW4Vq4VNppeQcvc2iDV1
 vsn08UbCnl4cLSHElmjKwoqcBXr5dyy4xpw1LwkgkOGTdm2N9JfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.123.94] ([178.202.40.247]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGRp-1qHFOq1TWn-00Pbs5; Fri, 08
 Sep 2023 20:52:53 +0200
Message-ID: <34abc752-919d-4bf3-8ef3-db01a09b71c3@gmx.de>
Date: Fri, 8 Sep 2023 20:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
References: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
Content-Language: en-US, de-DE
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20230907162200.205602-1-gatien.chevallier@foss.st.com>
X-Provags-ID: V03:K1:qNemXEIC1kVYYgJzuqfPgaRHZcbMIROj+g+GvWzmy+370E72oVq
 yRkrMIgWSqm6BajR4jFvq3Cy5KinLghLaSwyJift6PrN1hgoPwt9xAlxN4WdXzWtdQIyskd
 qVlDxKXMRRNEn7iOlH7UmMbfFTi9LVx7IKVKHosC8PcJ6eZxKo1fqZU3h5aUQ6VbvivHuhN
 1WS6LIsYfqWpAjbc/RfcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M2XHUtfFYck=;F3WkoQRE/iHpXmtbOC7L+poPKwV
 0tcagX84AY6aB0/fNzWuzSlQ1FCOJcuAsnmh7lgftE61X8GiPdW2BVcCF8ijlHMYMWIiCSlm0
 kiHAGklMQNX7QAQODfPMQliov+kXFCjQ3RKbd7WvS03RB+4QoACkDSAsZ4wCxtHDYyx0UESqi
 uxs9R4pBePau74+cMPYthJH7p/cI/qUdKBweYJwFdquIn9Gp6YSF2UrlUC9yqq1gr/KR5X8C6
 PBuBmXuCiKCb4M/LoApFg1vJaY+Nul7HT1GmrNPfaHIS6BCqOkPxU7B/eCJbBC8IRW+fPBzP7
 7uuzBuqCR9KGlol9IqQ0onl2ysonYtooqPyalPVR5CKUp+w0P5wZKkN6riGr30yQgVA4r2ruV
 1cr9Dxwh3pxUxCyBW/NVvmVdlTEd5XyXXCq41u7K0qMo3SBQl3jc12aarOErWn8Gn4Zi6zjGd
 Rg1AAh58cfxv1uJ9xAntcpVbIADysBCxU66uLqZBy2KZbX9b6jbcV/kcKUaZJ7c9PD/hCAVV+
 yTyxa+Kw21X7khgLTQNlmDNl8Aj5OhGgMMtEIHBZNGrFQNUf0iJIvdRCAb//pujp6VjUmqGaJ
 XNWjPVpyWx7dFHvy/H1nor6Op3eVRSDRnv8AV22+7m5ROzgy79RDGE2A7d4sjIrzVIEF4SkAI
 s9RTbjfMbbQ4C1LRxlACKUYpI51Y0COoE+XF+/3U/LfK7c+B4uNI/qMqD3GZj0Y85jC8CqnQ8
 YWkI1rCMhOm6ZZ3SHKp24yfJFvoig59x02k8FvCSJduV7FdFjKCp/5j4wp8j8DAKqiq1GRwEK
 LlJrt4vvZqexPClW++FdFk1/xNVfy9Io0uzPN+7n9rDFcT8ZiHWUgROkj/BlxEFRalcC04Hij
 jttKZsf0yuIu1Ma/j+LehVncM8MxYmmmODE4VJ+Xyc3Ije6+iFKAFXUQp24l4HMMf5ZRmek2d
 /fIuhX+pVSHydot1MdoZneQxywQ=
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 1/7] rng: stm32: rename STM32 RNG driver
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

On 9/7/23 18:21, Gatien Chevallier wrote:
> Rename the RNG driver as it is usable by other STM32 platforms
> than the STM32MP1x ones. Rename CONFIG_RNG_STM32MP1 to
> CONFIG_RNG_STM32
>
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

LGTM

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
