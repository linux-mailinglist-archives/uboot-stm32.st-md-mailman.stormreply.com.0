Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFFE1B2E61
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 19:36:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A438C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 21 Apr 2020 17:36:49 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B92A1C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 17:36:47 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id d7so12702081oif.9
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vX/G0mwD5iG1/a8fWV5XbE+hlUUBo/s8vwf0JZz18bA=;
 b=dhh36PZTmu5dBECiykfM9k18jHs9L3adCRtEoU2oqYpiZzxEykHNjM9GKH1TPmWVvb
 HM0luXlnec8tS/R7Hl2XcGzvhtdVQ0h9A2q/B8+PorD7vi+JCeQ8hE4Y2XExMjPlGMPc
 pFKjEvvlmGi8PwXzMM/WY2+vxVj9vVRmfnMuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vX/G0mwD5iG1/a8fWV5XbE+hlUUBo/s8vwf0JZz18bA=;
 b=QUuumuunDEO1sLa1cidDKpkQcFdbeNNJF2KpW6dsBOIon0ceM/3uisvZJoSRjtxBNs
 MtT93KNTz8NHTs4swAq9JNgMsLUhKV3cUuiAdy7rVccBAII47W4Gw82H/Xmt47FpcWlP
 IGn5mGOcUSNYp3TxysSYlPK11jyChNC41PnzMtAE9yUmVmoGv74Lyt/XxAaymDxsn1Wx
 nKZjfNTBb1VKxw8HS451mcd4z9mIYkmoVNfxZToovIyjZj3cICvuQfbi+6V6kZCK/oeq
 zf6sJW8GPVvZKu50MpUb1JOAIRzNnjB7hpXpvFH8RGU8OHTylrRi6qHk84rrJx4vK6Ej
 sYyA==
X-Gm-Message-State: AGi0PuYPR7EcS3fk4/+ZUL0XytZ/q7ygQKaxEt9YC+F0TFDeIflkuBTd
 p7N3vsZJTGxTYZmVwcwXB6p3zi33QU5ZYyor5b0mxA==
X-Google-Smtp-Source: APiQypK3anE2AAHXVha0O++nCQ9RurECzeNdJ2GUXjaJPtDtvwhd1WDHYjun9W4+JtjJ1+n5VIVWZjFknqVttsR0CcM=
X-Received: by 2002:aca:bb83:: with SMTP id l125mr3856043oif.122.1587490605872; 
 Tue, 21 Apr 2020 10:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200421140840.25729-1-patrice.chotard@st.com>
 <20200421140840.25729-3-patrice.chotard@st.com>
In-Reply-To: <20200421140840.25729-3-patrice.chotard@st.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 21 Apr 2020 11:36:34 -0600
Message-ID: <CAPnjgZ2h+xuUshDeUCtGQu81oHJ+poproR1B4oXiuS=yFzA-Yw@mail.gmail.com>
To: Patrice Chotard <patrice.chotard@st.com>
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>,
 Patrick DELAUNAY <patrick.delaunay@st.com>,
 Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] cmd: bind: allow to bind driver
	with driver data
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

Hi Patrice,

On Tue, 21 Apr 2020 at 08:09, Patrice Chotard <patrice.chotard@st.com> wrote:
>
> Initial implementation invokes device_bind_with_driver_data()
> with driver_data parameter equal to 0.
> For driver with driver data, the bind command can't bind
> correctly this driver or even worse causes data abort.
>
> Add find_udevice_id() to parse the driver's of_match list
> and return the entry corresponding to the driver compatible string.
> This allows to get access to driver_data and to use it as
> parameters of device_bind_with_driver_data().
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>
>
> ---
>
>  cmd/bind.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>

The thing I don't quite get here is why the driver name needs to be
specified. If the device tree node is present, and it has a compatible
string, can't DM find the driver and bind a device automatically?

Also, is there any docs for this command? It would be good to add to
doc/driver-model and also add a simple test.

Regards,
Simon
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
