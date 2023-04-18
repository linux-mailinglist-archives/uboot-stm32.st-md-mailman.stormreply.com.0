Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 702466E5BF6
	for <lists+uboot-stm32@lfdr.de>; Tue, 18 Apr 2023 10:25:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1AA49C03FC3;
	Tue, 18 Apr 2023 08:25:31 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 475CFC0356E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Apr 2023 08:25:30 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 71FFE85732;
 Tue, 18 Apr 2023 10:25:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681806329;
 bh=INyTiWDulfZSAMvsc+zufS1nQvmy+e/qhJrn63MfJ3A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Pv9EQIFJCmX+o/Uw/qfzAVKIAKinG0kJw6XcI4Wbl+bXGwIlGnowNO6LRS5jGt8uP
 SoHhKwbSHb9IBJkTyV115wceu8/F5lxtqnvSRGvN177KTWbfr8w19oIQnwVgvQbk3W
 b69bj5JtiIQ6Br4AbLo5BauIohxaDbgYYhubBeLq8VIMht77dCfRvhDFSgkbDg8WDS
 2cJkTtynLRarsC14MWDzZoDrDnxZPWcCwbLdq125ieWcDwzmB6wA39JTSJVaiWFJMc
 6uv70b7sfaUxOR53qhyYsedfObFbkcsSgOH17STYfHsjQkuNxGt5+FQGJ8Io10ZIJl
 P1dlhxPqCxkew==
Message-ID: <a0754b42-9ea4-5b38-1bae-2dd91ceb7f28@denx.de>
Date: Tue, 18 Apr 2023 10:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
 <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
 <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <f1de64e5-a99c-1eb2-edf5-3f6bd492692e@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: onboard-hub: Don't disable regulator
 in remove() callback
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

On 4/18/23 09:21, Patrice CHOTARD wrote:
> Hi Marek

Hello Patrice,

> On 4/17/23 19:00, Marek Vasut wrote:
>> On 4/17/23 18:56, Patrice Chotard wrote:
>>> In case USB hub regulator is shared, unexpected behavior occurs.
>>> On stm32mp135f-dk, stm32mp157c-ev1 and stm32mp157x-dkx, regulator
>>> v3v3 is shared between several IP/devices (USB, panel, ethernet phy,
>>> camera, ...).
>>> Running command "usb stop", v3v3 regulator is switched off and
>>> the splashscreen content disappear.
>>>
>>> v3v3 shouldn't be disabled on usb_onboard_hub_remove() callback.
>>
>> Isn't the regulator enable/disable refcounted ?
> 
> There is no refcount on regulator that's why we let regulator enable.

Can we add that, instead of hacking around the missing refcount in every 
driver ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
