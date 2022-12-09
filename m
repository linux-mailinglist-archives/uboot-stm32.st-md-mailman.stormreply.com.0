Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 423CA647BC0
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Dec 2022 02:56:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C55FFC65E63;
	Fri,  9 Dec 2022 01:56:37 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42860C65E5D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Dec 2022 01:56:36 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 630FF812BE;
 Fri,  9 Dec 2022 02:56:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1670550995;
 bh=7hanR05OuKpVohzwDRcRwVQL1V/4KoBg+1SCR7Yubo4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bK5bWrtqvWkCeZmE++kTCUq8RJhGe2zUYO85FJo9QMbpjPg8+8GgD/uLhshxh9n0v
 lPlArYYlLJJpAxzrApidazZvfyjdg5EbAFmAEEKAMqn2bGqtVEjHezyHsM9sJRVs0Q
 j+WTJUV0HJHiY4zpSynIhl7i93eY3sItHhloxeUmrp67IeN4rwPI1xQzyjiQUsGcba
 LXZb3BIyMOcpO1g3y8bePO1KFatyIDPluuBZZMwHR1UR2dPRQEar+52HgXZMAjQZBm
 goi2Lfq+m9JKOp/iStxr5Il9Z8fcVDYST9L2Uapp/0KvRGuTW0C0L7wOJFnV5nmJJM
 9Oo/gvTKZJaLQ==
Message-ID: <567234e5-fed0-65dd-b528-4160a58420a3@denx.de>
Date: Fri, 9 Dec 2022 02:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220909114513.v2.1.I5eabf3f9fdbbaf763cd44e9c018cb5b74a0c65ac@changeid>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Anatolij Gustschin <agust@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v2 1/2] usb: hub: allow to increase
	HUB_DEBOUNCE_TIMEOUT
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

On 9/9/22 11:45, Patrick Delaunay wrote:
> Add a new CONFIG_USB_HUB_DEBOUNCE_TIMEOUT to increase the
> HUB_DEBOUNCE_TIMEOUT value, for example to 2s because some usb device
> needs around 1.5s or more to make the hub port status to be
> connected steadily after being powered off and powered on.
> 
> This 2s value is aligned with Linux driver and avoids to configure
> "usb_pgood_delay" as a workaround for connection timeout on
> some USB device; normally the env variable "usb_pgood_delay" is used
> to delay the first query after power ON and thus the device answer,
> but this variable not used to increase the connection timeout delay.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Applied to usb/master, thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
