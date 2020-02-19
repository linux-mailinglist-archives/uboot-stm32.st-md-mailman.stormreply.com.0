Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 085241651DD
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Feb 2020 22:46:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5580C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 19 Feb 2020 21:46:48 +0000 (UTC)
Received: from avon.wwwdotorg.org (avon.wwwdotorg.org [104.237.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 97EF7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Feb 2020 21:46:47 +0000 (UTC)
Received: from [10.20.204.51] (unknown [216.228.112.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by avon.wwwdotorg.org (Postfix) with ESMTPSA id BEB3A1C092D;
 Wed, 19 Feb 2020 14:46:45 -0700 (MST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.1 at avon.wwwdotorg.org
To: Patrick Delaunay <patrick.delaunay@st.com>
References: <20200212184501.5911-1-patrick.delaunay@st.com>
 <20200212184501.5911-11-patrick.delaunay@st.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <7ad3f604-3910-0433-cd3e-cbe50511910f@wwwdotorg.org>
Date: Wed, 19 Feb 2020 14:46:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200212184501.5911-11-patrick.delaunay@st.com>
Content-Language: en-US
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 u-boot@lists.denx.de, Simon Glass <sjg@chromium.org>,
 Mario Six <mario.six@gdsys.cc>, Stephen Warren <swarren@nvidia.com>
Subject: Re: [Uboot-stm32] [RESEND PATCH 10/10] test: sandbox: add test for
	erase command
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

On 2/12/20 11:45 AM, Patrick Delaunay wrote:
> Add test for the erase command tested on ENV in EXT4.

> -    """ env_location: ENVL_EXT4 (2)
> +    """ env location: ENVL_EXT4 (2)

> -    """ restore env_location: ENVL_NOWHERE (12)
> +    """ restore env location: ENVL_NOWHERE (12)

Was there a whitespace mistake in the earlier path or something? I can't 
see a diff here...
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
