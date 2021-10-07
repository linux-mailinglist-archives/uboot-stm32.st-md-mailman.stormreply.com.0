Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E1425901
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Oct 2021 19:13:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A8CAFC597B2;
	Thu,  7 Oct 2021 17:13:15 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D28AC57182
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Oct 2021 17:13:14 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id y207so6762096oia.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Oct 2021 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kWNPhbOu+7vuaQO4crTSDg8LwHDoSbrgsTdidHuVNJI=;
 b=ZBx9cruq3EYs5JrZBilvyO1U6o7A6BSNBj4majx3YAKa8wJrPK07KY2XpiX5r8WRXH
 x9df6/stSFGjdmEt3lAj8fYBGeudQoqBoHArrlrsKVyrpoYyi9Dz+CcRn14TR+jHEjHN
 6MZT10/HNAb7ZHjpvaLTwhZ9TZcxpfY5olGH0AeaLlclmzhFXau1f36MmVZGhSvnvhQL
 3RGq4NUto9C0BprPD6Ls9mHgp0x+gXNALq2zCXRoOvmwuBivVV/OFEbsyp+Aq4Kns3uC
 OWTVbdHsqlPIyRnCePRa2sSWuRZHhpFmeLZU72kNkPY5SIpTQ304ranZ4YGluYUs1XrR
 IwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kWNPhbOu+7vuaQO4crTSDg8LwHDoSbrgsTdidHuVNJI=;
 b=5w6yOXYPdAFax+1Ys2DIcIs/XSpzND1Gf+p6f6vYqWSYeC/WbqcDSKP3/Pj+da/7bw
 iLeQ8xW3TB0NiPtgj8ZrZKa/MrAZAGXi7Dm5/IC9EqqDOzKnRXW2KzVLj61AN4NjTB8C
 yJb3XHUCXKxTZjY3LKtjqxy0jRlxGQrPHHBgp/+G2SGKcIfewN9SzHBO9T0A2Lu5i06K
 Ds6KgyC2ivuJPGrcrZlD52It+6mrMOBm67Opx7pyw55JWNF3YNpaJ3yty1YWq0s22J1S
 R6gBGpekAk5cFfoFBs0yfidkrumt82+iFpQmSyLPP5CU3wUiLh+TI/nMpnI/HCmd59M7
 zHhQ==
X-Gm-Message-State: AOAM533c08HIGsgIa8Kkq1PcwnjNf+u5CW/6a/VMpmirZM2TZm1xcHC3
 Ty8GFlA5wlSe5XQrSYLttd8=
X-Google-Smtp-Source: ABdhPJzkjcwFA23WpuioskeM826HbxOEmpWGMfSQgpC4deUzskONhAP0GmBMm9yrI6iIT0pc+g3iDg==
X-Received: by 2002:a05:6808:21a8:: with SMTP id
 be40mr2229225oib.20.1633626792834; 
 Thu, 07 Oct 2021 10:13:12 -0700 (PDT)
Received: from nuclearis3.gtech (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id bl23sm7248oib.40.2021.10.07.10.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 10:13:12 -0700 (PDT)
To: Patrick DELAUNAY <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210909145536.2979951-1-mr.nuke.me@gmail.com>
 <f517fc64-f8e2-f722-40f0-174bf709c145@foss.st.com>
From: "Alex G." <mr.nuke.me@gmail.com>
Message-ID: <ccf4d20e-907f-02f4-aafc-e6c75f0932a5@gmail.com>
Date: Thu, 7 Oct 2021 12:13:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f517fc64-f8e2-f722-40f0-174bf709c145@foss.st.com>
Content-Language: en-US
Cc: uboot-stm32@st-md-mailman.stormreply.com, marex@denx.de,
 etienne.carriere@linaro.org
Subject: Re: [Uboot-stm32] [PATCH 0/3] stm32mp: Attempt to resolve
 unintended breakage with v2021.10-rc2
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

SGkgUGF0cmljaywKCk9uIDkvMTQvMjEgNzoyNiBBTSwgUGF0cmljayBERUxBVU5BWSB3cm90ZToK
PiBIaSBBbGV4YW5kcnUsCgo+IEkgdGhpbmsgeW91IG5lZWQgdG8gdXBkYXRlwqAgYXJjaC9hcm0v
bWFjaC1zdG0zMm1wL0tjb25maWcKPiAKPiAKPiBzb21ldGhpbmcgbGlrZToKPiAKPiAKPiAgwqBj
b25maWcgU1RNMzJNUDE1eAo+ICDCoMKgwqDCoCBib29sICJTdXBwb3J0IFNUTWljcm9lbGVjdHJv
bmljcyBTVE0zMk1QMTV4IFNvYyIKPiAtwqDCoMKgIHNlbGVjdCBBUkNIX1NVUFBPUlRfUFNDSSBp
ZiAhVEZBQk9PVAo+IC3CoMKgwqAgc2VsZWN0IEFSTV9TTUNDQyBpZiBURkFCT09UCj4gK8KgwqDC
oCBzZWxlY3QgQVJDSF9TVVBQT1JUX1BTQ0kgaWYgIVRGQUJPT1QgJiYgIVNQTF9PUFRFRV9JTUFH
RQo+ICvCoMKgwqAgc2VsZWN0IEFSTV9TTUNDQyBpZiBURkFCT09UIHx8IFNQTF9PUFRFRV9JTUFH
RQo+ICDCoMKgwqDCoCBzZWxlY3QgQ1BVX1Y3QQo+IC3CoMKgwqAgc2VsZWN0IENQVV9WN19IQVNf
Tk9OU0VDIGlmICFURkFCT09UCj4gK8KgwqDCoCBzZWxlY3QgQ1BVX1Y3X0hBU19OT05TRUMgaWYg
IVRGQUJPT1QgJiYgIVNQTF9PUFRFRV9JTUFHRQo+ICDCoMKgwqDCoCBzZWxlY3QgQ1BVX1Y3X0hB
U19WSVJUCj4gIMKgwqDCoMKgIHNlbGVjdCBPRl9CT0FSRF9TRVRVUAo+ICDCoMKgwqDCoCBzZWxl
Y3QgUElOQ1RSTF9TVE0zMgo+IEBAIC00Nyw4ICs0Nyw4IEBAIGNvbmZpZyBTVE0zMk1QMTV4Cj4g
IMKgwqDCoMKgIHNlbGVjdCBTVE0zMl9TRVJJQUwKPiAgwqDCoMKgwqAgc2VsZWN0IFNZU19BUkNI
X1RJTUVSCj4gIMKgwqDCoMKgIGltcGx5IENNRF9OVkVESVRfSU5GTwo+IC3CoMKgwqAgaW1wbHkg
U1lTUkVTRVRfUFNDSSBpZiBURkFCT09UCj4gLcKgwqDCoCBpbXBseSBTWVNSRVNFVF9TWVNDT04g
aWYgIVRGQUJPT1QKPiArwqDCoMKgIGltcGx5IFNZU1JFU0VUX1BTQ0kgaWYgVEZBQk9PVCB8fCBT
UExfT1BURUVfSU1BR0UKPiArwqDCoMKgIGltcGx5IFNZU1JFU0VUX1NZU0NPTiBpZiAhVEZBQk9P
VCAmJiAhU1BMX09QVEVFX0lNQUdFCj4gIMKgwqDCoMKgIGhlbHAKPiAgwqDCoMKgwqAgwqDCoMKg
IHN1cHBvcnQgb2YgU1RNaWNyb2VsZWN0cm9uaWNzIFNPQyBTVE0zMk1QMTV4IGZhbWlseQo+ICDC
oMKgwqDCoCDCoMKgwqAgU1RNMzJNUDE1NywgU1RNMzJNUDE1MyBvciBTVE0zMk1QMTUxCj4gQEAg
LTE1Myw3ICsxNTMsNyBAQCBjb25maWcgTlJfRFJBTV9CQU5LUwoKVGhpcyBpcyBhIHRlcnJpYmxl
IGlkZWEuIFdlJ3JlIHRyeWluZyB0byBhbnN3ZXIgYSBmZXcgcXVlc3Rpb25zOgogICAgKiBEaWQg
dGhlIEZTQkwgcHJvdmlkZSBhIFBTQ0kgc2VjdXJlIG1vbml0b3IKICAgICogSXMgdS1ib290IHJ1
bm5pbmcgaW4gbm9ybWFsIG9yIHNlY3VyZSB3b3JsZAoKQnV0IGluc3RlYWQgb2YgY2xlYXJseSBk
ZWZpbmluZyB0aG9zZSBhbnN3ZXJzLCB3ZSdyZSB0cnlpbmcgdG8gaW5mZXIgCnRoZW0gZnJvbSBv
dGhlciBjb25maWcgb3B0aW9ucy4gVGhpcyBpcyBjb25mdXNpbmcgdG8gc3RhcnQgd2l0aCwgYnV0
IAppdCdzIGFsc28gd3JvbmcuCgpGb3IgZXhhbXBsZSwgU1BMX09QVEVFX0lNQUdFIG1lYW5zICJ3
ZSBzdXBwb3J0IE9QVEVFIGltYWdlcyBpbiBTUEwiLiBJdCAKZG9lc24ndCBtZWFuIHRoYXQgd2Ug
bG9hZGVkIGFuIE9QLVRFRSBrZXJuZWwgYXQgYWxsLiBTUEwgd2l0aCAKU1BMX09QVEVFX0lNQUdF
IG1heSBhcyB3ZWxsIGJvb3QgYSBsZWdhY3kgdWJvb3QgaW1hZ2UgLS0gbm90aGluZyAKcHJldmVu
dHMgaXQuIFNvIHRvIGluZmVyIGZyb20gdGhpcyB0aGF0IHUtYm9vdCBydW5zIGluIHRoZSBub3Jt
YWwgd29ybGQgCmlzIHdyb25nLgoKV2l0aG91dCBsb3NzIG9mIGdlbmVyYWxpdHksIGFueSBDT05G
SUcgdGhhdCBjb25mbGF0ZXMgdS1ib290IG9wdGlvbnMgCndpdGggU1BMIG9wdGlvbnMgaXMgbGlr
ZWx5IHRvIGNhdXNlIHNvbWUgY2hhbmdlcyBkb3duIHRoZSBsaW5lLgoKCj4gU28ganVzdCBpbnRy
b2R1Y2UgQ09ORklHX1RGQUJPT1RfRklQX0NPTlRBSU5FUiBkb24ndCBzb2x2ZSBhbGwgdGhlIAo+
IGlzc3Vlcy4uLi4KPiAKPiAKPiBJIHRoaW5rIHlvdSBuZWVkIHRvIG1hbmFnZSBDT05GSUdfU1BM
X09QVEVFX0lNQUdFCj4gdG8gaGFuZGxlIHNwZWNpZmljIGNhc2Ugd2hlbiBPUFRFRSBpcyBydW5u
aW5nIGFmdGVyIFNQTC4KClN1cmUsIGJ1dCBJJ2QgaGF2ZSB0byBhZGp1c3QgdGhpcyBhdCBydW50
aW1lLCBub3QgaW4gS2NvbmZpZyBmb3IgdGhlIApyZWFzb25zIGFib3ZlLgoKPiBJIHRyeSB0byBl
eHBlcmltZW50IHRoZSBPUFRFRSBsb2FkIGJ5IFNQTCBidXQgSSBkb24ndCBzZWUgaG93IAo+IHRo
ZSBPUC1URUUgcGFnZXIgY2FuIGJlIG1hbmFnZWQgYnkgU1BMIGluIHRoZSBjdXJyZW50IGNvZGUu
Cj4gSXQgbXVzdCBsb2FkZWQgaW4gU1lSQU0gYXQgMHgyZmZjMDAwMCwgd2l0aCBhIHJpc2sgdG8g
b3ZlcndyaXRlIHRoZSBTUEwKPiBjb2RlIGxvYWRlZCBieSByb20gY29kZSBhdCAweDJmZmMyNTAw
LgoKVGhpcyBjb25zaWRlcmF0aW9uIGlzIG5vdCB1bmlxdWUgdG8gU1BMLiBJIGRvbid0IGhhdmUg
dGhhdCBwcm9ibGVtIApiZWNhdXNlIFNQTCBsb2FkcyBPUC1URUUgdG8gRFJBTSBhdCAweGRlMDAw
MDAwLiBJZiBPUC1URUUgd2FudHMgdG8gbG9hZCAKcGFydHMgb2YgaXRzZWxmIHRvIFNZU1JBTSwg
dGhhdCBoYXBwZW5zIGFmdGVyIFNQTCBwYXNzZWQgY29udHJvbCwgc28gdGhlIApjb25mbGljdCBp
cyBub3QgcmVsZXZhbnQuCgo+IG9yIGhvdyB0byBtYW5hZ2Ugc2V2ZXJhbCBiaW5hcnksIHNlZSBP
UC1URUUgaGVhZGVyIHYyIHN1cHBvcnQgaW4gT1AtVEVFLAo+IAo+IFNldmVyYWwgZmlsZSBpdCBp
cyBhbHJlYWR5IHN1cHBvcnRlZCBpbiBURi1BIEJMMiB3aXRoIEZJUDoKPiAKPiB0ZWUtaGVhZGVy
X3YyLmJpbgo+IHRlZS1wYWdlcl92Mi5iaW4KPiB0ZWUtcGFnZWFibGVfdjIuYmluCgpJIGRvbid0
IGtub3cgaG93IHRvIHVzZSB1c2UgdGhlIE9QLVRFRSBwYWdlciB3aXRoIFNQTCwgc28gSSBlbGVj
dGVkIG5vdCB0bzoKCkVYVFJBX09FTUFLRSA9ICJQTEFURk9STT0ke09QVEVFX1BMQVRGT1JNfSBc
CgkJQ0ZHX1dJVEhfUEFHRVI9biBcCgkJQ0ZHX05TX0VOVFJZX0FERFI9JHtLRVJORUxfVUlNQUdF
X0xPQURBRERSRVNTfSBcCgkJQ1JPU1NfQ09NUElMRT0ke0hPU1RfUFJFRklYfSBcCgkJQ0ZHX1RF
RV9DT1JFX0RFQlVHPXkgXAoJCUNGR19URUVfQ09SRV9MT0dfTEVWRUw9MiBcCgkJJHtUWkRSQU1f
RkxBR1N9IFwKICAgICAgICAgIgoKVFpEUkFNX0ZMQUdTID0gIkNGR19UWkRSQU1fU1RBUlQ9IDB4
ZGUwMDAwMDBcCiAgICAgICAgICAgICAgICAgQ0ZHX0RSQU1fU0laRT0weDIwMDAwMDAwICIKCkFs
ZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVWJvb3Qt
c3RtMzIgbWFpbGluZyBsaXN0ClVib290LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
dWJvb3Qtc3RtMzIK
