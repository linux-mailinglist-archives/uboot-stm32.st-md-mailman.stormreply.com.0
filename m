Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E19249E1142
	for <lists+uboot-stm32@lfdr.de>; Tue,  3 Dec 2024 03:30:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88CD2C6C83D;
	Tue,  3 Dec 2024 02:30:36 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EC88C6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Dec 2024 02:30:29 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6E2C788815;
 Tue,  3 Dec 2024 03:30:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1733193029;
 bh=Whyv2yVNfVDKQyKFan7bgqcv7dfKFWt2DrYh+B+W0vw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=y/NfvyP8g4lF5W+wLWmsoTIQPvkffjLXzIL+ZqAqUDJVl1PY5zEiawAGukd0yvFtM
 Phqx+HTRBatoW2fJd9RUA9BrQDCCLHw+pxQGuKVl2x+e55BKOtQhyQa6d0WK+ngEtb
 FV8X0Kt7l0B/cs2gK1zFXzRjbFCSf7LSfIKnSYQLf3RWKbZQIfmMts5+IqMV//twL2
 U/O3roQeAvYaXhh6v7gXGCSOj03Rqd1ia05N5vuJkL/fbYgJEdGHcgifrgS8YTVm3n
 ipdfZhHW7qIpLyR58pi1DKxT3GSJMNxvzMpLieE3FRJwbn7g0qmsV8yrP0GZmJiLym
 isJe+6XHx37+A==
Message-ID: <7e22db87-96bd-4046-b08b-070e8be00624@denx.de>
Date: Tue, 3 Dec 2024 02:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, u-boot@lists.denx.de
References: <20241202074644.5380-1-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241202074644.5380-1-patrice.chotard@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, Tom Rini <trini@konsulko.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Lukasz Majewski <lukma@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] usb: gadget: f_mass_storage: Add
 schedule() in sleep_thread()
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

On 12/2/24 8:46 AM, Patrice Chotard wrote:
> In case "ums" command is used on platforms which don't implement
> g_dnl_board_usb_cable_connected() and USB cable is not connected,
> we stay inside sleep_thread() forever and watchdog is triggered.
> 
> Add schedule() call to avoid this issue.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Is this a bugfix for 2025.01 ?
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
