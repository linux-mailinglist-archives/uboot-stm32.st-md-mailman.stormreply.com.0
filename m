Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82683B35EA9
	for <lists+uboot-stm32@lfdr.de>; Tue, 26 Aug 2025 14:01:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7DCEC3F932;
	Tue, 26 Aug 2025 12:01:29 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C438C3F930
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 12:01:28 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QBCJls019114;
 Tue, 26 Aug 2025 14:01:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0FRrXFOpniyR4NZ7tR64hr27gtWsu+h/2xP3DO6XnJ4=; b=qnyv+eyBkRz0rCoO
 Hvy3+u6bzIGJ4vl8X6VizLk+kWqvRBbmzklDrpPopBD2cLHekelDTNOxDNxviJyG
 HLhVuwR9n4PPi7Nz/Op9f0whAMiDreOrlXkCXfIh9KCGaN9Y0oqGZN+iRIA6tX5Q
 a9OTHkEmVpwJvT77OEmuYMPzVlHkFZXNX/+mlqDvC9Vm3ZX7YTn4cqNxB0HJcjSH
 l77/cdYsOUqY9/BizKM5Pbx5L9RgBdPiTJyPYdzhE9j5ghLwYbOpONvKbuq5MVys
 HnXJq5VVNr794bfzrMbR3mWOg0cPJzR0FSDlP9MUP4CxdJRigG98g43jzCcPufWM
 O2kWlQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qrkmgndm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Aug 2025 14:01:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 713F840053;
 Tue, 26 Aug 2025 14:00:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BC23B6C6479;
 Tue, 26 Aug 2025 14:00:08 +0200 (CEST)
Received: from [10.130.74.180] (10.130.74.180) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 14:00:08 +0200
Message-ID: <0e4b1f64-8c6e-418d-9c1d-77625aa9e58c@foss.st.com>
Date: Tue, 26 Aug 2025 14:00:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>, Tom Rini
 <trini@konsulko.com>, Kamil Lulko <kamil.lulko@gmail.com>, Dillon Min
 <dillon.minfei@gmail.com>, Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Anatolij Gustschin <ag.dev.uboot@gmail.com>,
 Simon Glass <sjg@chromium.org>, Sumit Garg <sumit.garg@kernel.org>
References: <20250820-master-v1-0-fc76f18ab2fd@foss.st.com>
 <20250820-master-v1-7-fc76f18ab2fd@foss.st.com>
 <b071f211-38a8-4eef-94ce-e1b3d02ef929@foss.st.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <b071f211-38a8-4eef-94ce-e1b3d02ef929@foss.st.com>
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCH 7/8] ARM: dts: stm32: remove panel
 property in stm32mp257f-ev1-u-boot
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA4LzI1LzI1IDE1OjU0LCBQYXRyaWNlIENIT1RBUkQgd3JvdGU6Cj4KPiBPbiA4LzIwLzI1
IDE4OjE3LCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+PiBTQ01JIHJlZ3VsYXRvcnMgYXJl
IG5vdCB5ZXQgaW1wbGVtZW50ZWQgaW4gT1AtVEVFLiAgVGhpcyBsZWFkcyB0byBhbgo+PiBpbnZh
bGlkIGFyZ3VtZW50IGVycm9yIHdoZW4gcmV0cmlldmluZyB0aGUgJ3Bvd2VyLXN1cHBseScgcHJv
cGVydHkuCj4+IFVsdGltYXRlbHkgdGhpcyBjaGFpbnMgaW50byB0aGUgcGFuZWwgbm90IHByb2Jp
bmcgYW5kIG1ha2VzIHRoZSB3aG9sZQo+PiBkaXNwbGF5IHBpcGUgZmFpbC4KPj4KPj4gUmVtb3Zl
IHRoZSBwcm9wZXJ0eSBpbiB0aGUgdXBzdHJlYW0gZGV2aWNlLXRyZWUgdG8gYWxsb3cgZGlzcGxh
eSBwaXBlIHRvCj4+IGJvb3QuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJhcGhhZWwgR2FsbGFpcy1Q
b3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+Cj4+IC0tLQo+PiAgYXJjaC9hcm0v
ZHRzL3N0bTMybXAyNTdmLWV2MS11LWJvb3QuZHRzaSB8IDQgKysrKwo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vZHRzL3N0bTMy
bXAyNTdmLWV2MS11LWJvb3QuZHRzaSBiL2FyY2gvYXJtL2R0cy9zdG0zMm1wMjU3Zi1ldjEtdS1i
b290LmR0c2kKPj4gaW5kZXggOWE1NjZlMThkM2ZkOWIwY2Y0ZTIxNjA1ZjJjYjA2MGI0OWZhZGNi
Ni4uN2E0YjYyMzY2NGExZTE2N2NjYzBmNGM3M2E5NzlhMDgzMzM3ZDdhMiAxMDA2NDQKPj4gLS0t
IGEvYXJjaC9hcm0vZHRzL3N0bTMybXAyNTdmLWV2MS11LWJvb3QuZHRzaQo+PiArKysgYi9hcmNo
L2FybS9kdHMvc3RtMzJtcDI1N2YtZXYxLXUtYm9vdC5kdHNpCj4+IEBAIC0xMiw2ICsxMiwxMCBA
QAo+PiAgCX07Cj4+ICB9Owo+PiAgCj4+ICsmcGFuZWxfbHZkcyB7Cj4+ICsJL2RlbGV0ZS1wcm9w
ZXJ0eS8gcG93ZXItc3VwcGx5Owo+PiArfTsKPj4gKwo+PiAgJnVzYXJ0MiB7Cj4+ICAJYm9vdHBo
LWFsbDsKPj4gIH07Cj4+Cj4gVGhpcyBwYXRjaCBpcyBhIHRlbXBvcmFyeSBwYXRjaCByaWdodCA/
Cj4gSWYgeWVzLCBpIGFtIG5vdCBpbiBmYXZvciB0byBhcHBsaWVkIHRoaXMgcGF0Y2gsIGkgcHJl
ZmVyIHRvIHNlZSB0aGF0IHRoZXJlIGlzIHNvbWV0aGluZyBtaXNzaW5nLgo+Cj4gVGhhbmtzCgpI
aSBQYXRyaWNlLAoKWWVzIGl0IGlzIHRlbXBvcmFyeS7CoCBJIHdpbGwgcmVtb3ZlIHRoaXMgcGF0
Y2ggZnJvbSB0aGUgdXBjb21pbmcgc2VyaWVzLgpJIHVuZGVyc3RhbmQgeW91ciBpbnRlbnRpb24s
IGp1c3QgbWluZCB0aGF0IHRoZSBkaXNwbGF5IHBpcGUgd29uJ3Qgd29yayB1bnRpbApTVE0zMiBP
UC1URUUgZ2V0cyBTQ01JIHJlZ3VsYXRvcnMgaW1wbGVtZW50ZWQuCgpCZXN0IHJlZ2FyZHMsClJh
cGhhw6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClVi
b290LXN0bTMyIG1haWxpbmcgbGlzdApVYm9vdC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3Vib290LXN0bTMyCg==
