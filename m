Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E7448F621
	for <lists+uboot-stm32@lfdr.de>; Sat, 15 Jan 2022 10:26:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35E50C60461;
	Sat, 15 Jan 2022 09:26:40 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F02BC5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Jan 2022 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642238796;
 bh=hNi4wn/8owG+7MTwtsHP4yMCH2MMtrtJpDRI+R0AyjA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Z8pLmoiVhgZweKZdybRqzyg9wk92byUWLdPCoudVCL1u9ZoMw/2W120g8I4x+u57O
 ekfrgqsgun4pKRRBbm1eJFUi3mkdLMR5jpYHuwlVtwnnKcL8H+bB8ByWziwbZHmOJL
 TSkFAroZoGZEWLmwPn3M897e5EmOOdMmIVNhRIdQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.94] ([88.152.144.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbRs-1n72mI2Nf4-00H3lE; Sat, 15
 Jan 2022 10:26:36 +0100
Message-ID: <be841b93-3f4b-c606-43cb-cfd58b506095@gmx.de>
Date: Sat, 15 Jan 2022 10:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20220112105327.1.I74f7b02a4d65313e46a505e7c371c3691701a0f9@changeid>
 <20220112105327.8.Ie3a53cf98ca389d4d05b0d353047f19ddc1c2530@changeid>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
In-Reply-To: <20220112105327.8.Ie3a53cf98ca389d4d05b0d353047f19ddc1c2530@changeid>
X-Provags-ID: V03:K1:mc8PXeD3Zxu9auJ/dB46CbimXBfNlHVuEXugmYU7gVVS4VjjScu
 WO670HOL1C0ZZDvj0Gxpxy5ffZ2fSXdpTsogXLMMkitVBwL+2tDIyYrO2u9uHtp4xcq0C7L
 HSehihvGdIlCxlleU2p9u4J522V81IH4RgwXkRhldGnrFjo6kFqsPm4f6kEeNatT0ChlvP/
 kpum3wUYP5GFXImIMKOSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:a7Tmf0Pr7Eg=:kkXtOXgknum5mMoRcRA0R5
 KWQTJGvxWgY/hJFWzRuCXcqZhTfXTmUQ21UhnV98wC9WsBaewTxuVuyB0aH2k7AZam9MCqHwe
 eNRZvg6luZjHBXZX/VEK0QPwD56QTZQaMgPOZf+Oxzt6bTKJfhPuWsEmani7jAas5YNozAbxq
 oRSSzYnjvur0YN36tsIisu7TlCcRdqpnrtt9k/silJIHstanrOr75dWkgKOQVYTBtYaKcAA84
 6kpUy8OVY38ivsUGYIGwl1PIBVxpZoCPUSXxUWLo2wwwhKjapxERJHmLsHXoWac7HITsZM/lY
 qNMKBsjhWwXnyJz3JBucIuWmCp1IgUcGbsOKqdtBv2I+p4Hd73fBzAF732Cp5QMs4dPDFZtWu
 KntVf1UyT8CgXZdGyqQQND6ECmhPPJWOG+Xnf830V/tVSIsPDmjLfpnqjMamexu5v9B7HZk29
 b9F8GmuIqFjU+dxWBc1t+Kx2k+FZcEStbzAPMX4BC3xN+/VxF6/4dkaIn4EgP0Y9y5L6cl8Z1
 xnrXH4V5OSkz7hCSP7QPzApt8VqPG6U7pqB9xguWxXI/4EyOZPggmmNwvIofZzWyBOVxt+gqc
 1GumqUwye8NZx2Boj6zEY98sZogcunxf4J46VojhwPFZ568/m3jrIXVA/YlyKF0wodA+fDsbM
 B3V5BSXQx41tShbOgn+fCEC+/YAI84nCr33CJroOvMUYXFy9wa/ZVDF2b658PfBPiPqwIb1ak
 IltIwx7RuLBX2Ix+jP0Wrf1aFIKRMyr3vrFk0njIRZLClGNEtMZVNQyQNChhXWI9gonRRoR8x
 625XkHCVhHiCw3gOjKRV1yaYZR8KvWkKLQfGRRMdyEFu7MfQBs53OyRovd0yMNqr4KmNcPEqf
 TAK/fWmVvuZwJgPgcM5iCZt9Myq0uYt2tob5i7ZJ4LGfX3125/MdumreJerE0wC81Ca26Qqq3
 DCDabtQNDtpQybSSaCwNXvMo+4yQCJNc0H82X/kJWqXiBCYuX0MyQiyeSqiEm+0ns5yer5e4V
 m6FUWfwFMCUY7+ZXQL17i+OdaLmZC4VCVmS6v7A9uWk9sgN+TXZDq9v+pYqVfCf6n3ee6IG0E
 Ht3//bn42ObNR4=
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 8/9] doc: add include/dm/of*.h to the HTML
	documentation
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

On 1/12/22 10:53, Patrick Delaunay wrote:
> Correct Sphinx style comments in include/dm/ofnode.h
> and add the device tree node API to the HTML documentation;
> the ofnode functions are compatible with Live tree or with flat
> device tree.
>
> Signed-off-by: Patrick Delaunay<patrick.delaunay@foss.st.com>
> ---

Reviewed-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
