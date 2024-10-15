Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0C99FC7B
	for <lists+uboot-stm32@lfdr.de>; Wed, 16 Oct 2024 01:30:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38CB2C78030;
	Tue, 15 Oct 2024 23:30:26 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3E6BC7801A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Oct 2024 23:30:19 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BFA8D88216;
 Wed, 16 Oct 2024 01:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1729035019;
 bh=vslqs3vYEmcd3tB4op0RofMwhoj6zjj8XAtbxv39vv8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fV7QUj9WasW1lcVaA9huFkr+IMJCS/aqFqis8UKIHgv9SCWL8SbphXvd24XHp+EKf
 3R4dpk7MCqFR4aezWWyTXHjmWlgkCez7McD8rejAVUnzEZfmVaF4OrNdpN4taunwSr
 kCsUyrRkkCTY2rfUsWmVCG/cg1wb7ayIFDfkd2q690FkQjIIaPPig+nVrh63ah9slF
 1vwOP67nNPW630GVkvXfjOjBAHJR31R5FRIcpWdsUPToM2d/664VkGZcBi9jFPM4im
 e3WenmOcwlsO6i64Wa7JxeIyXFrBuK8hON+h1a6+cV1mw4exenP31sN3IDy5LPPVsA
 jIxKtfDvf8YdQ==
Message-ID: <13639f31-5ef4-49d7-a695-9cc064ef2371@denx.de>
Date: Wed, 16 Oct 2024 01:27:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Tom Rini <trini@konsulko.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20241004230756.371153-1-marex@denx.de>
 <172902143755.5381.3133865412226742988.b4-ty@konsulko.com>
 <8cfc2a0f-dfef-4528-95fa-298bfc701ac7@kwiboo.se>
 <20241015225241.GA6412@bill-the-cat>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241015225241.GA6412@bill-the-cat>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Sumit Garg <sumit.garg@linaro.org>, u-boot@dh-electronics.com,
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 AKASHI Takahiro <akashi.tkhro@gmail.com>, Sean Anderson <seanga2@gmail.com>,
 u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 Peter Robinson <pbrobinson@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 1/2] Makefile: Drop SPL_FIT_SOURCE support
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

On 10/16/24 12:52 AM, Tom Rini wrote:
> On Tue, Oct 15, 2024 at 10:48:12PM +0200, Jonas Karlman wrote:
>> On 2024-10-15 21:43, Tom Rini wrote:
>>> On Sat, 05 Oct 2024 01:07:13 +0200, Marek Vasut wrote:
>>>
>>>> The SPL_FIT_SOURCE is long superseded by SPL_FIT_GENERATOR which
>>>> is long superseded by binman, drop SPL_FIT_SOURCE support as there
>>>> are no more users.
>>>>
>>>>
>>>
>>> Applied to u-boot/master, thanks!
>>>
>>
>> Look like 5b9261fb0b1e ("Makefile: Drop SPL_FIT_GENERATOR support") may
>> have broken ARCH_ZYNQMP, it still seem to use a mkimage_fit_atf.sh and
>> CI pipeline now fails:
>>
>> https://source.denx.de/u-boot/u-boot/-/pipelines/22715
> 
> Sigh, thanks.
And yes, I missed that, sorry.

Do you want a revert for 2/2 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
