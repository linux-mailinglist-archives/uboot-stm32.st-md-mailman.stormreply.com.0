Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45178740D
	for <lists+uboot-stm32@lfdr.de>; Thu, 24 Aug 2023 17:26:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B033C6B44F;
	Thu, 24 Aug 2023 15:26:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B76EFC6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Aug 2023 15:26:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B2DCA8468A;
 Thu, 24 Aug 2023 17:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1692890764;
 bh=6s8cWWlyfIBhZUO7513pV36nguCNywdgdGXhyMqgxXA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ykmJrSYvLUKm5nDRAa1pQWgahGGrw2MLsNrDBN1E/zAPpSziqgg+xL5UoFXmJVa4p
 TuZ2NrV6PHY1kUo+hjsrOcrvjNmCnMbHnlM/ObHiRQSiZVe+ODsS/6TfLZRhxEDa9N
 i7X7pAZ27DjpghoAF/RAZ/NbC69yRvQirWc6MJ6SHRVQoNVOkd6psUXOyIpI+mxA1m
 aveFbz6QtLAea35pnd3FAQhvWrg36TLPr3K1cKETtvahM3WOV9luQ8LA89MQjx/D6m
 ujDgx6b0MVjDIHfw32iuWEqgf3yUCKrtKVacnHyCc0KHjhWsLZMXNTVDVDtf6foKvP
 rBiJ8UpSUGVCg==
Message-ID: <7fc90036-0be8-6567-fb3b-b97fa7643180@denx.de>
Date: Thu, 24 Aug 2023 17:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Tom Rini <trini@konsulko.com>
References: <20230824030304.1555547-1-sjg@chromium.org>
 <20230824030304.1555547-7-sjg@chromium.org>
 <3ab486b0-be22-48b9-7417-742ed8360f0f@denx.de>
 <20230824142505.GM3953269@bill-the-cat>
 <4cbffed6-6a07-1a56-bf10-7303e2aff78b@denx.de>
 <20230824151419.GU3953269@bill-the-cat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230824151419.GU3953269@bill-the-cat>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: u-boot@dh-electronics.com, Vikas Manocha <vikas.manocha@st.com>,
 Simon Glass <sjg@chromium.org>, Kamil Lulko <kamil.lulko@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH 6/6] stm32mp15: Use u-boot-spl-stm32.bin
 instead of u-boot-spl.stm32
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

On 8/24/23 17:14, Tom Rini wrote:
> On Thu, Aug 24, 2023 at 05:09:07PM +0200, Marek Vasut wrote:
>> On 8/24/23 16:25, Tom Rini wrote:
>>> On Thu, Aug 24, 2023 at 05:12:45AM +0200, Marek Vasut wrote:
>>>> On 8/24/23 05:02, Simon Glass wrote:
>>>>> A '.stm32' extension is not allowed anymore, so change it.
>>>>
>>>> Why?
>>>>
>>>> This will likely break a huge amount of scripts, I'm tempted to NAK it
>>>> unless there is a very good reason.
>>>
>>> This is in the cover letter.  Today, buildman --keep-outputs doesn't
>>> actually keep the needed for booting outputs from a build for a number
>>> of platforms.  Simon's response is to stop having a free-form list of
>>> outputs. With I guess the caveat being ROM-defined names (for example,
>>> we still keep "MLO" because that is the literal filename TI ROM looks
>>> for on FAT partitions, on mos of their 32bit platforms).
>>
>> Why not just place the free-form files into some output/ directory and be
>> done with it ? Then they can have whatever extension they want, as long as
>> the output/ directory name is stable.
> 
> Yes, an alternative here is to just extend the list that's removed in
> patch 2/6.

I ... am not on CC of that patch ...

It would be really good if Simon CCed everyone involved on all the patches.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
