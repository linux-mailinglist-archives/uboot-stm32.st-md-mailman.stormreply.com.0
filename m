Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95666B1489B
	for <lists+uboot-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57051C3F933;
	Tue, 29 Jul 2025 06:49:52 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6997CC32EA8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Jul 2025 12:54:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753361641; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gqG2KnFNA/177UTuZVg5/ax9jco/lsPq8DObU12aQn7O5z3bjbQ0IItJ4wpSwJiZ13zqyuvwddvTr6svgQ4mkDotLdOPYqbzURtIImRMVCK83I8O6OGyyWf5CCgq2i4PwP7Gb7l00mijOqnlrfS5k7XDq0rQJnGyP2fb71+p0ng=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753361641;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wrTkPoT/oKgGK+rq3Eilxsb8Q5h/dbMvaTNTnNDe1M0=; 
 b=Q/83oaP6eNVdvxjcs8jxtMu0sBNelmKJLq+RBEwsxh5CIZ79h+pjw4n9hQYTpjUXWyGqJFW0JYuhWhEVYTyc2IjoV4zxegWmjBFeFwponbmXWgldHbCu3p9u2DuOeptHJKmPqO0o9TmgxHM8iSQR63bFqwKvNPrbEaHmHtZXtlM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=pigmoral.tech;
 spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
 dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753361641; 
 s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
 h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=wrTkPoT/oKgGK+rq3Eilxsb8Q5h/dbMvaTNTnNDe1M0=;
 b=eTJCman1pD9x1vQN1VbYV7q3qJEPG2bFlhjRDeYnJHGyDOBv6bngdsAZY0eZVt2O
 AE6otT1Bys+w9Hlb3hVPYVs0BFD0GV345xIjd1aJOmvhAotW87MYpDSOZ97tRIEMp0t
 XYpyxkWUUdm2G5KdWyfec+RegD5poioTLSENLrgs=
Received: by mx.zohomail.com with SMTPS id 1753361638123607.544490869297;
 Thu, 24 Jul 2025 05:53:58 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Patrick Delaunay" <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
In-Reply-To: <20250723170913.1.I20e0e3d5851ea2e4a22b20be372800fe059cc2d1@changeid>
Message-ID: <1855311d6ccd0f78.fc55a2def266a393.a3bb5f06dd850306@Jude-Air.local>
Date: Thu, 24 Jul 2025 12:53:52 +0000
X-ZohoMailClient: External
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:49:34 +0000
Cc: Marek Vasut <marex@denx.de>, Kongyang Liu <seashell11234455@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] usb: dwc2: fix reset logic in
	dwc2_core_reset
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

On 23/07/2025 17:09, Patrick Delaunay wrote:
> Use GUSBCFG_FORCEHOSTMODE to detected the HOST forced mode as it is done
> in the Linux driver drivers/usb/dwc2/core.c:dwc2_core_reset().
> 
> The host polling must be executed only if the current mode is host,
> either due to the force HOST mode (which persists after core reset)
> or the connector id pin.
> 
> The GUSBCFG_FORCEDEVMODE bits is used to force the device mode (for
> example used on STM32MP1x platform) and when it is activated the DWC2 reset
> failed with the trace:
> "dwc2_core_reset: Waiting for GINTSTS_CURMODE_HOST timeout"
> 
> Fixes: c5d685b8993c ("usb: dwc2: Unify flush and reset logic with v4.20a support")
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks for the fix.

Reviewed-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Best regards,
Junhui Liu

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
