Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA94437E9C
	for <lists+uboot-stm32@lfdr.de>; Fri, 22 Oct 2021 21:26:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91AA5C5C85E;
	Fri, 22 Oct 2021 19:26:08 +0000 (UTC)
Received: from mail.nic.cz (lists.nic.cz [217.31.204.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94AD8C5C85C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Oct 2021 19:26:06 +0000 (UTC)
Received: from thinkpad (unknown [172.20.6.87])
 by mail.nic.cz (Postfix) with ESMTPSA id ED3B4140614;
 Fri, 22 Oct 2021 21:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1634930766; bh=v8J2vns/RdN6p0nTA6ekmKV6pAV4SzyfDjJa7gekrLo=;
 h=Date:From:To;
 b=IhAE6rQrUuRCstumdK2PbcYESFFZAz0v62F1crW8miyR5YGB54ajoiEmpv0mKn1ph
 Yag3/Vl7sCC9DoZVQLaLtMDN7cKhaJBx0V/bEh+XuKBOEXNsQ4q4zDYF1mz/0dab3h
 AAcpOPdGWPwlCSU31xtQJEogF7Y+4xYk/SQlW0NE=
Date: Fri, 22 Oct 2021 21:26:05 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Adam Ford <aford173@gmail.com>
Message-ID: <20211022212605.6ff8998a@thinkpad>
In-Reply-To: <CAHCN7xJOtTDtF1BoNChO=_4OPmdPoJQ=zg3Of3y0RUJfrhabrQ@mail.gmail.com>
References: <927b122e-1f62-e790-f5ca-30bae4332c77@foss.st.com>
 <CAHCN7xJOtTDtF1BoNChO=_4OPmdPoJQ=zg3Of3y0RUJfrhabrQ@mail.gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
 USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
 autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.4 at mail
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>, U-Boot Mailing List <u-boot@lists.denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Subject: Re: [Uboot-stm32] Question: LTO and failing objcopy in
 "u-boot-initial-env" target
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

On Fri, 22 Oct 2021 14:19:16 -0500
Adam Ford <aford173@gmail.com> wrote:

> I am not sure it's the right solution, but it appears to work for me
> on a board that uses LTO.  I didn't try it with a board that doesn't
> use LTO.

Need to be tested with GCC as well as Clang.

Marek
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
