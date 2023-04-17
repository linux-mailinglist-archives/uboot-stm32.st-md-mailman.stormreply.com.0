Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B526E4EB4
	for <lists+uboot-stm32@lfdr.de>; Mon, 17 Apr 2023 19:00:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77687C65E70;
	Mon, 17 Apr 2023 17:00:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 78740C65E58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Apr 2023 17:00:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7E86185F3F;
 Mon, 17 Apr 2023 19:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1681750835;
 bh=JNwqKt8xJ1EFEd+DJy7hKqJhFvnWx3MOXtQ/W4oH/Xc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ufYwUMMjM1btbZz8ZLwU9vxUh0i60Eblk31Dz6mhvVK9k/n7FtodFr9m2nAt9/3dD
 QGRbtGwb8aW3btrrVIFE803YN+rRmW6d32BKsU9LYeM1UuELPdbjIOlySlX/iGzCcT
 T4oxcjVkLUnritl2bK3tJ5sBoEOTUu4xMGvzqg7n8Zc123308MzEQq66Gz/rMiEWRK
 NwWtfQj9bnwcz5YJfNi4oJtOQMNr0peqefAaj8RAO45ST4tn0kapf/jAynqwAmrpyN
 I+u0ACk1U1zGxrBc+Nm7letcgm/x7q5DdD5MdcH7msC4vED/5YpYLlwQts+Ef2eIJL
 GURQr+5rGPVaw==
Message-ID: <d3e391f5-ce85-e5f9-41e4-81e271db8deb@denx.de>
Date: Mon, 17 Apr 2023 19:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20230417185558.1.If7ed2ccb5a1c1a84637d29d763cc1935d9b8815e@changeid>
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

On 4/17/23 18:56, Patrice Chotard wrote:
> In case USB hub regulator is shared, unexpected behavior occurs.
> On stm32mp135f-dk, stm32mp157c-ev1 and stm32mp157x-dkx, regulator
> v3v3 is shared between several IP/devices (USB, panel, ethernet phy,
> camera, ...).
> Running command "usb stop", v3v3 regulator is switched off and
> the splashscreen content disappear.
> 
> v3v3 shouldn't be disabled on usb_onboard_hub_remove() callback.

Isn't the regulator enable/disable refcounted ?
If not, it should be, that would be the correct fix.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
